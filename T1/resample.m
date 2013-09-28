function y = resample( x, m )
%RESAMPLE Summary of this function goes here
%   Detailed explanation goes here

l = length(x);
y = zeros(1,m*l);
for i=1:l
    for j=1:m
        y(m*i-m+j) = x(i);
    end
end
end

