function [ pt ] = prob_err( n,j,p )
%PROB_ERR Summary of this function goes here
%   Detailed explanation goes here
 pt = comb(n,j)*(p^j)*(1-p)^(n-j);

end

