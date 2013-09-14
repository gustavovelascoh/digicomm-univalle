function y = delay_mod( x)
%DELAY_MOD Summary of this function goes here
%   Detailed explanation goes here

l = length(x);

f = [x(1) ~x(1)];
c = ~x(1);
if x(1) == 1   
    y(1:2) = f;
else
    c = ~c,
    y(1:2) = [c c];
end


for i=[2:l]
    if(x(i-1) == 0) && (x(i) == 0)
        c = ~c;
    end
    
    if x(i)==1
        f = ~f;
        y(i*2-1:i*2) = f;
    else   
        y(i*2-1:i*2) = [c c];
    end    
end

end

