%% computeH - compute the homography from p2 to p1
% inputs
% p1 - a 2xn vector of points
% p2 - a 2xn vector of points
% outputs
% H - A homography mapping points p1 to p2
% A - The matrix where eig(A'A) is used to generate the solution. (For
% debugging)
function [H,A] = computeH(p1,p2)
A = zeros(size(p1,2)*2,9);

for i = 1:size(p1,2)
    A(2*(i-1)+1,:) = [0 0 0 -p1(1,i) -p1(2,i) -1 p1(1,i)*p2(2,i) p1(2,i)*p2(2,i) p2(2,i)];
    A(2*(i-1)+2,:) = [p1(1,i) p1(2,i) 1 0 0 0 -p1(1,i)*p2(1,i) -p1(2,i)*p2(1,i) -p2(1,i)];
end

%[U,D,V] = svd(A);
[V,D] = eig(A'*A);
v = V(:,1);
H = reshape(v,3,3)';
end