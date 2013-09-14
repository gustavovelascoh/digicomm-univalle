function y = rz_ami( x )
%RZ_AMI Summary of this function goes here
%   Detailed explanation goes here

l = length(x);
c = -1;
for i = [1:l]
    if x(i) == 1
        c = c*-1;
        y(4*i-3) = 0;
        y(4*i-2) = c;
        y(4*i-1) = c;
        y(4*i) = 0;        
    else
        y(4*i-3) = 0;
        y(4*i-2) = 0;
        y(4*i-1) = 0;
        y(4*i) = 0;
    end
end
end

