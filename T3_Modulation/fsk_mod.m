function y = fsk_mod( x, M, df )
%FSK_MOD Summary of this function goes here
%   Detailed explanation goes here

f = x*df;
l = length(x);

spT = 200;
freq = 6;
t = linspace(0,2*pi,spT);

for i=1:l
   
    y((spT*(i-1)+1):spT*i) = sin(t*(freq+f(i)));
    
end

end

