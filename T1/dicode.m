function y = dicode( x, rz )
%DICODE Summary of this function goes here
%   Detailed explanation goes here

l = length(x);

if rz == 0
    y(1) = -bit2level(x(1));
else
    y(1) = bit2level(x(1));
end

for i=1:l
    if i == 1
        if rz==0
            y(i) = -bit2level(x(i));
        else
            y(2*i-1:2*i) = [-bit2level(x(i)) 0];
        end
    else        
        if x(i-1) ~= x(i)
            if rz==0
                y(i) = -bit2level(x(i));
            else
                y(2*i-1:2*i) = [-bit2level(x(i)) 0];
            end     
        else
            if rz==0
                y(i) = 0;
            else
                y(2*i-1:2*i) = [0 0];
            end
            
        end
    end
end

end

