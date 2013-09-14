function y = polar_rz( x,t )
%POLAR_RZ Summary of this function goes here
%   Detailed explanation goes here

l = length(x)

for i = [1:l]
    if x(i) == 1
        y(2*i-1) = 1;
        y(2*i) = 0;
    else
        if t == 0
            y(2*i-1) = 0;
            y(2*i) = 0;
        else
            y(2*i-1) = -1;
            y(2*i) = 0;
        end
    end
end

end

