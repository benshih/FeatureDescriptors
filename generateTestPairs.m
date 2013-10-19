% Benjamin Shih
% 10/17/2013
% 16720 HW3 BRIEF Feature Descriptions
% 2.1 Creating a Set of BRIEF Tests

% Generate a static set of test pairs and save that data to a file. Points
% are in the format: x1,y1,x2,y2 assuming the patch is 9x9 and centered
% around 0,0

testPairs = randi([-4,4], 256, 4);
save('testPairs.mat', 'testPairs');