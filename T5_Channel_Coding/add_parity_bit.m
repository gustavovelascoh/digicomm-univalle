function [ y ] = add_parity_bit( x )
%ADD_PARITY_BIT Summary of this function goes here
%   Detailed explanation goes here

y = [0 x];

if mod(sum(x),2) ~= 0
    y(1) = 1;
end

end

