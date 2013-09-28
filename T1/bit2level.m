function [ y ] = bit2level( x )
%BIT2LEVEL Summary of this function goes here
%   Detailed explanation goes here

y = x-1*(~x);

end

