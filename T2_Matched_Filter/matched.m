function y = matched( x, s, sps)
%MATCHED Summary of this function goes here
%   Detailed explanation goes here
%   x: signal + noise
%   s: bank of symbols (mirrored)
%   sps: samples per symbol

[m,n] = size(s);
l = length(x);
suma = zeros(m,1);

for i=1:l
    
    ind = mod(i,sps);
    
    if ind == 0        
        ind = 20;
    end
    if ind == 1
        suma = zeros(m,1);        
    end
    

    suma = suma + (x(i)*s(:,ind));
    y(:,i) = suma;
    
end


end