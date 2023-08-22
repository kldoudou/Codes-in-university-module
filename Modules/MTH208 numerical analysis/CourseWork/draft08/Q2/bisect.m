function [a,b] = bisect(y)
% find root boundary
% ab is the index through 0
a = 1;b = length(y);
if y(a)*y(b) > 0 
    error(['f(a) and ' ...
        'f(b) must have ' ...
        'different signs']);
end
while b-a > 1
    if y(a)==0||y(b)==0
        break
    end
    mid = floor((a+b)/2);
    if y(a)*y(mid) > 0
        a = mid;
    else
        b = mid;
    end
end
end