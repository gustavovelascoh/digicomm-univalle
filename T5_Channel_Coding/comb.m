function [ c ] = comb( n,j )
%COMB Summary of this function goes here
%   Detailed explanation goes here

c = factorial(n)/(factorial(j)*factorial(n-j));

end

