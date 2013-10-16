% Benjamin Shih
% 10/16/2013
% 16720 HW3 BRIEF Feature Descriptions
% 2.3 Assembling the BRIEF Descriptor



function [locs, desc] = brief(im)
    
    % Load parameters and test patterns
    sigma0 = 1;
    k = sqrt(2);
    levels = [-1 0 1 2 3 4];
    th_contrast = 0.03;
    th_r = 12;
    
    patchWidth = 9;
    nbits = 256; % number of tests in the BRIEF descriptor
    
    [compareX, compareY] = makeTestPattern(patchWidth, nbits); 
    
    % Get keypoint locations
    [locs, GaussianPyramid] = DoGdetector(im, sigma0, k, levels, th_contrast, th_r);
    
    
    % Compute a set of valid BRIEF descriptors
    
    [locs, desc] = computeBrief(im, locs, levels, compareX, compareY);
    
end
