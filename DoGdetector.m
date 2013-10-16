% Benjamin Shih
% 10/16/2013
% 16720 HW3 BRIEF Feature Descriptions
% 1.2 DoG Detector



function [locs, GaussianPyramid] = ...
    DoGdetector(im, sigma0, k, levels, th_contrast, th_r)

GaussianPyramid = createGaussianPyramid(im, sigma0, k, levels);
[DoGPyramid, DoG_levels] = createDoGPyramid(GaussianPyramid, levels);
PrincipalCurvature = computePrincipalCurvature(DoGPyramid);
locs = getLocalExtrema(DoGPyramid, DoG_levels, PrincipalCurvature, th_contrast, th_r);
    
end
