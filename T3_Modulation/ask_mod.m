function [ y ] = ask_mod( x,M )
%ASK_MOD Summary of this function goes here
%   Detailed explanation goes here


a = x/M;
l = length(x);

spT = 200;
freq = 6;
t = linspace(0,2*pi,spT);

for i=1:l
   
    y((spT*(i-1)+1):spT*i) = a(i)*sin(t*freq);
    
end

end

