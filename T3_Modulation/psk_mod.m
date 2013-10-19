function y = psk_mod( s, bos, sps, w0 )
%PSK_MOD Summary of this function goes here
%   Detailed explanation goes here

l = length(s);
y = zeros(1,l);
[a b] = size(bos);

t = linspace(0,1.5,sps);
tt = 0+1/sps:1/sps:1*(l/sps);

for i=1:l/sps
    
    for j=1:a
        if s(sps*(i-1)+1:sps*i) == bos(j,:)
            %sym(i) = j;
            break;
        end
        %sym(i) = j;
    end

    carr = sin(w0*t +2*pi*j/a);
    y(sps*(i-1)+1:sps*i) = carr;

end

plot(tt,y);
end

