% Benjamin Shih
% 10/15/2013
% 16720 HW3 BRIEF Feature Descriptions
% 1.1.1 Create DoG Pyramid

function [DoGPyramid, DoG_levels] = createDoGPyramid(GaussianPyramid, levels)
    DoG_levels = 0:length(levels)-2;
    DoGPyramid = zeros([size(GaussianPyramid(:,:,1)),length(DoG_levels)]);
    for i = 1:length(levels)-1
        DoGPyramid(:,:,i) = GaussianPyramid(:,:,i+1) - GaussianPyramid(:,:,i);
    end

end



