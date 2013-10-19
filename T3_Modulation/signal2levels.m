function y = signal2levels( s, bos, sps, M )
%SIGNAL2LEVELS Summary of this function goes here
%   Detailed explanation goes here

l = length(s);
y = zeros(1,l/sps);

for i=1:l/sps
    
    for j=1:M
        if s(sps*(i-1)+1:sps*i) == bos(j,:)
            y(i) = j-1;
            break;
        end
    end
end

end

