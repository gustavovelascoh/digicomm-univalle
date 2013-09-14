function y = bi( x ,t)
%BI Summary of this function goes here
%   Detailed explanation goes here

l = length(x);

if t == 0
    for i = [1:l]        
        y(i*2-1:i*2) = [x(i) ~x(i)];
    end
else    
    if t==2
       v = 0;
       f = x(1);
    else
       v = 1;
       f = ~x(1);
    end
    
    c = 0;

    for i=[1:l]    
        if(x(i) == v)            
            y(i*2-1:i*2) = [f ~f];
            
        else
            if (i ~=1)
                if x(i-1) ~= x(i)
                    if v == 1
                        f = ~f;                    
                    end
                end
            end
            y(i*2-1:i*2) = [c c];
            c = ~c;
    end
end

end
end



