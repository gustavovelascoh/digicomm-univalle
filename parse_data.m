function y = parse_data( x )
%PARSE_DATA Summary of this function goes here
%   Detailed explanation goes here
if (regexp(x,'^[01]{4,16}$'))
    y = split_str(x);
else
    y = 0;
end

