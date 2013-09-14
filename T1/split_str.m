function arr = split_str( str )
%SPLIT_STR Summary of this function goes here
%   Detailed explanation goes here

l = length(str);

for i = [1:l]
    arr(i) = str2num(str(i));
end

end

