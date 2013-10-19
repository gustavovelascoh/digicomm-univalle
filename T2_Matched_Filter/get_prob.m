function y = get_prob( s0, z, a)
%GET_PROB Summary of this function goes here
%   Detailed explanation goes here

y = (1/s0*sqrt(2*pi))*exp(-0.5*((z-a)/s0).^2);

end

