function m = update_m( eirp, gr, t, ebno, r, ls, lo )
%UPDATE_M Summary of this function goes here
%   Detailed explanation goes here
k = 1.3806e-23;
m = 20*log(eirp*gr/(t*k*r*ls*lo))-ebno;

end

