% Benjamin Shih
% 10/16/2013
% 16720 HW3 BRIEF Feature Descriptions
% 2.2 Compute the BRIEF Descriptor

% Compute the BRIEF descriptor for the detected keypoints. 

function [locs, desc] = computeBrief(im, locs, levels, compareX, compareY)
    

    [locs, GaussianPyramid] = DoGdetector(im, sigma0, k, levels, th_contrast, th_r);

end
