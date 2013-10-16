%normCoord - Normalize the image coordinates in p
%inputs
%p - a 2xn vector of coordinates
%T - A 3x3 transform and scaling matrix used to normalize the points
%n - a 2xn vector of normalized coordinates
function [T,n] = normCoord(p)

P = [p;ones(1,size(p,2))];
mn = mean(p,2);
T1 = [1 0 -mn(1); 0 1 -mn(2); 0 0 1];
P_ = T1*P;
d = (P_(1,:).*P_(1,:) + P_(2,:).*P_(2,:)).^.5;
s = sqrt(2)/(sum(d)/size(p,2));
T2 = [s 0 0; 0 s 0; 0 0 1];
T = T2*T1;

P = T*P;
n = P(1:2,:);

end