% Benjamin Shih
% 10/16/2013
% 16720 HW3 BRIEF Feature Descriptions
% 1.1.3 Detecting Extrema

% Use the DoG detector to choose points that are local extrema in both
% scale and space

function [locs] = getLocalExtrema(DoGPyramid, DoG_levels, PrincipalCurvature, th_contrast, th_r)
    locslvl = zeros(0,3);
    I = zeros(0,1);
    J = zeros(0,1);
    [m, n] = size(DoGPyramid(:,:,1));
    
    for lev = 2:length(DoG_levels)-1
        curr = DoGPyramid(:,:,lev);
        
        % Find the local extrema in space.
        for i = 2:m-1
            for j = 2:n-1
                neighbors = [curr(i-1, j-1)   curr(i-1, j)  curr(i-1, j+1) ...
                          curr(i, j-1)     curr(i, j+1) ...
                          curr(i+1, j-1)   curr(i+1, j)  curr(i+1, j+1)];             
                if (8 == sum(curr(i,j) > neighbors) || 8 == sum(curr(i,j) < neighbors))
                   I = [I; i];
                   J = [J; j];
                end
            end
        end
        
        length(I) % check the number of points that are obtained in the first round
        
        
  
        
        % Verify the remaining local extrema in scale.
        up = DoGPyramid(:,:,lev+1);
        down = DoGPyramid(:,:,lev-1);
        scaleExtrema = (curr(sub2ind(size(curr), I, J)) > up(sub2ind(size(curr), I, J)) ...
            & curr(sub2ind(size(curr), I, J)) > down(sub2ind(size(curr), I, J))) ...
            | (curr(sub2ind(size(curr), I, J)) < up(sub2ind(size(curr), I, J)) ...
            & curr(sub2ind(size(curr), I, J)) < down(sub2ind(size(curr), I, J)));
        Icut = I.*scaleExtrema;
        Jcut = J.*scaleExtrema;
        newPts = [Icut Jcut]';
        newPts = newPts(:,sum(newPts)~=0)';
        I = newPts(:, 1);
        J = newPts(:, 2);

        size(I)
        
        % Threshold the remaining local extrema based on contrast.
        currC = DoGPyramid(:,:,lev);
        temp = currC(sub2ind(size(currC), I, J));
        contrastThresh = abs(currC(sub2ind(size(currC), I, J))) > th_contrast;
        Icut = I.*contrastThresh;
        Jcut = J.*contrastThresh;
        newPts = [Icut Jcut]';
        newPts = newPts(:,sum(newPts)~=0)';
        I = newPts(:, 1);
        J = newPts(:, 2);
        
        
        % Edge Supression
        
        % Threshold the remaining local extrema based on principal
        % curvature ratio.
        currR = PrincipalCurvature(:,:,lev);
        ratioThresh = currR(sub2ind(size(currR), I, J)) < th_r;
        Icut = I.*ratioThresh;
        Jcut = J.*ratioThresh;
        newPts = [Icut Jcut]';
        newPts = newPts(:,sum(newPts)~=0)';
        I = newPts(:, 1);
        J = newPts(:, 2);
        
        
        % The remaining points have passed. These shall be saved and
        % returned as the key points.   
        locslvl = [locslvl; I J lev*ones(size(I))];
    end
    
    [locs, ia, ic] = unique([locslvl(:,1) locslvl(:,2)], 'rows');
    locs = [locs locslvl(ia, 3)];
    
end


% function [locs] = getLocalExtrema(DoGPyramid, DoG_levels, PrincipalCurvature, th_contrast, th_r)
%     arb = 1000; % arbitrary maximum number of keypoints to prevent matlab reallocation complaints for locs matrix
%     locs = zeros(arb, 3);
%     nlocs = 0;
%     [m,n] = size(DoGPyramid);
% 
%     
%     for i = 1:m
%         for j = 1:n
%             % Determine if point is local extrema of its eight neighbors in space
%             % (adjacent pixels).
%             
%             
%             % Case1: Not along border of image
%             neighbors = [DoGPyramid(i-1, j-1)   DoGPyramid(i-1, j)  DoGPyramid(i-1, j+1)
%                          DoGPyramid(i, j-1)     DoGPyramid(i, j)    DoGPyramid(i, j+1)
%                          DoGPyramid(i+1, j-1)   DoGPyramid(i+1, j)  DoGPyramid(i+1, j+1)];
%             
%             % If in the neighborhood, the point is an extrema, then add it
%             % to the list of keypoint locations.
%             if 9 == sum(th_contrast >= neighbors) || 9 == sum(th_contrast <= neighbors)
%                 
%             end
% 
%             % Determine if point is local extrema of its two neighbors in scale
%             % (DoG_levels).
%             if PrincipalCurvature(m,n) >= th_r
%                 locs(i+1, :) = [m, n, DoG_levelscurr];
%                 
%             end
%         end
%     end
%     
% end
