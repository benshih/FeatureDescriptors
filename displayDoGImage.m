% disp dog image

figure;
for i = 1:5
    subplot(1,5,i); imagesc(abs(DoGPyramid(:,:,i)));
end