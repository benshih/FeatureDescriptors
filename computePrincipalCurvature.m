% Benjamin Shih
% 10/15/2013
% 16720 HW3 BRIEF Feature Descriptions
% 1.1.2 Edge Suppression

% Each point contains the curvature ratio R for the corresponding point in
% the DoG pyramid.

function [PrincipalCurvature] = computePrincipalCurvature(DoGPyramid)
    [m, n, k] = size(DoGPyramid);
    PrincipalCurvature = zeros(m,n,k);
    
    for l = 1:k
        [fx, fy] = gradient(DoGPyramid(:,:,k));
        [fxx, fxy] = gradient(fx);
        [fyx, fyy] = gradient(fy);

        for i = 1:m
            for j = 1:n
                H = [fxx(i,j) fxy(i,j); fyx(i,j) fyy(i,j)];
                r = trace(H)^2/det(H);
                PrincipalCurvature(i,j,l) = r;
            end
        end
    end
    
end

% function [PrincipalCurvature] = computePrincipalCurvature(DoGPyramid)
%     [m, n, k] = size(DoGPyramid);
%     PrincipalCurvature = zeros(m,n,k);
%     yfilt = [-1 1]';
%     xfilt = [-1 1];
%     
%     for l = 1:k
%         fx = filter2(xfilt, DoGPyramid(:,:,k), 'same');
%         fy = filter2(yfilt, DoGPyramid(:,:,k), 'same');
%         fxx = filter2(xfilt, fx, 'same');
%         fxy = filter2(yfilt, fx, 'same'); % equal to fyx
%         fyy = filter2(yfilt, fy, 'same');
% 
%         for i = 1:m
%             for j = 1:n
%                 H = [fxx(i,j) fxy(i,j); fxy(i,j) fyy(i,j)];
%                 r = trace(H)^2/det(H);
%                 PrincipalCurvature(i,j,l) = r;
%             end
%         end
%     end
%     
% end