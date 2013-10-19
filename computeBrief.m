% Benjamin Shih
% 10/16/2013
% 16720 HW3 BRIEF Feature Descriptions
% 2.2 Compute the BRIEF Descriptor

% Compute the BRIEF descriptor for the detected keypoints. Ignores the
% point if the entire patchWidth x patchWidth descriptor doesn't convolve on the image. 

function [locs, desc] = computeBrief(im, locs, levels, compareX, compareY)
    sigma0 = 1;
    k = sqrt(2);
    patchWidth = 9;
    patchSize = [patchWidth, patchWidth];
    GaussianPyramid = createGaussianPyramid(im, sigma0, k, levels);
    numLocs = 0;
    
    desc = zeros(length(locs), length(compareX)); 
    locsNew = zeros(size(locs));

    for iLocPoint = 1:length(locs)
        x = locs(iLocPoint, 1);
        y = locs(iLocPoint, 2);

        % Throw out points that are along the border of the image.
        if 0 >= x-4 || 0 >= y-4 || size(im, 2) < x+4 || size(im, 1) < y+4
            continue;
        end

        numLocs = numLocs + 1;
        locsNew(numLocs, :) = locs(iLocPoint, :);

        for jnBit = 1:length(compareX)
            [x1, y1] = ind2sub(patchSize, compareX(jnBit));
            [x2, y2] = ind2sub(patchSize, compareY(jnBit));

            % Compute the BRIEF descriptor.
            if GaussianPyramid(x+x1, y+y1, locs(iLocPoint, 3)+2) < ...
                    GaussianPyramid(x+x2, y+y2, locs(iLocPoint, 3)+2)
                desc(numLocs,jnBit) = 0;
            else
                desc(numLocs,jnBit) = 1;
            end
        end
    end
    
    locs = locsNew(1:numLocs,:);
    desc = desc(1:numLocs,:);
end
