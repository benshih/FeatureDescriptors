% Benjamin Shih
% 10/16/2013
% 16720 HW3 BRIEF Feature Descriptions
% 2.1 Creating a Set of BRIEF Tests

% Generate a static set of test pairs and save that data to a file. Points
% are in the format: x1,y1,x2,y2 assuming the patch is 9x9 and centered
% around 0,0

function [compareX, compareY] = makeTestPattern(patchWidth, nbits)
    
    patchSize = [patchWidth patchWidth];
    
    pairs = randi([ceil(-patchWidth/2),floor(patchWidth/2)], nbits, 4);
    testPairs(:,2) = pairs(:,2) + ceil(patchWidth/2);
    testPairs(:,4) = pairs(:,4) + ceil(patchWidth/2);
    testPairs(:,1) = mod(ceil(patchWidth/2)-pairs(:,1), patchWidth);
    testPairs(:,3) = mod(ceil(patchWidth/2)-pairs(:,3), patchWidth);
    for iRow = 1:length(testPairs(:,1))
        if(0 == testPairs(iRow,1))
            testPairs(iRow,1) = 9;
        end
        if(0 == testPairs(iRow,3))
            testPairs(iRow,3) = 9;
        end
    end
    compareX = sub2ind(patchSize, testPairs(:,1), testPairs(:,2));
    compareY = sub2ind(patchSize, testPairs(:,3), testPairs(:,4));
    
    
    save('testPairs.mat', 'compareX', 'compareY');
end
