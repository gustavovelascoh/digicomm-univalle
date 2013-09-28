function y = nrz_m( x , t)
%NRZ_M Summary of this function goes here
%   Detailed explanation goes here

l = length(x);

if t == 0
    y(1) = bit2level(x(1));
else
    y(1) = -bit2level(x(1));
end

for i=[2:l]
    if(x(i) == t)
        y(i) = y(i-1);
    else
        y(i) = -y(i-1);
    end
end
end

