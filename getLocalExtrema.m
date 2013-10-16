% Benjamin Shih
% 10/16/2013
% 16720 HW3 BRIEF Feature Descriptions
% 1.1.3 Detecting Extrema

% Use the DoG detector to choose points that are local extrema in both
% scale and space

function [locs] = getLocalExtrema(DoGPyramid, DoG_levels, PrincipalCurvature, th_contrast, th_r)
    locs = zeros(1, 3);
    [m,n] = size(DoGPyramid);

    
    for i = 1:m
        for j = 1:n
            % Determine if point is local extrema of its eight neighbors in space
            % (adjacent pixels).
            
            
            % Case1: Not along border of image
            neighbors = [DoGPyramid(i-1, j-1)   DoGPyramid(i-1, j)  DoGPyramid(i-1, j+1)
                         DoGPyramid(i, j-1)     DoGPyramid(i, j)    DoGPyramid(i, j+1)
                         DoGPyramid(i+1, j-1)   DoGPyramid(i+1, j)  DoGPyramid(i+1, j+1)];
            
            % If in the neighborhood, the point is an extrema, then add it
            % to the list of keypoint locations.
            if 9 == sum(th_contrast >= neighbors) || 9 == sum(th_contrast <= neighbors)
                
            end

            % Determine if point is local extrema of its two neighbors in scale
            % (DoG_levels).
            if PrincipalCurvature(m,n) >= th_r
                locs(i+1, :) = [m, n, DoG_levelscurr];
                
            end
        end
    end
    
end
