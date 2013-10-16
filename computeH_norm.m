% computeH_norm - compute the homography between two point sets
% inputs
% p1 a 2xn vector of coordinates
% p2 a 2xn vector of coordinates
% outputs
% H a homography matrix mapping p1 to p2
function [H,A] = computeH_norm(p1,p2)
[T1,p1x] = normCoord(p1);
[T2,p2x] = normCoord(p2);
[H,A] = computeH(p1x, p2x);
H = T2\H*T1;
end