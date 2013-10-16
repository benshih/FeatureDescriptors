function [] = plotMatches(im1, im2, matches, locs1, locs2)
width = size(im1,2) + size(im2,2);
height = max(size(im1,1), size(im2,1));
img = zeros(height, width);
size(img)
img(1:size(im1,1),1:size(im1,2)) = im1;
img(1:size(im2,1),size(im1,2)+1:size(im1,2) + size(im2,2)) = im2;
imagesc(img);colormap(gray);
axis equal;
hold on;
for i = 1:length(matches)
    p1 = locs1(matches(i,1),:);
    p2 = locs2(matches(i,2),:);
    %plot(p1(2),p1(1), 'g*');
    %plot(size(im1,2)+p2(2),p2(1), 'g*');
    line([p1(2) size(im1,2)+p2(2)],[p1(1),p2(1)], 'Color','r','LineWidth',1);
end
hold off;
end