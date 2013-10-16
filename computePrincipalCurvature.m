% Benjamin Shih
% 10/15/2013
% 16720 HW3 BRIEF Feature Descriptions
% 1.1.2 Edge Suppression

% Each point contains the curvature ratio R for the corresponding point in
% the DoG pyramid.

function [PrincipalCurvature] = computePrincipalCurvature(DoGPyramid)
    [m, n] = size(DoGPyramid);
    PrincipalCurvature = zeros(size(m,n));
    
    
    for i = 1:m
        for j = 1:n
            H = 
            r = trace(H)^2/det(H);
            PrincipalCurvature(m,n) = r;
        end
    end
    
    
end
