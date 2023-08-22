function I = simpson_eacht(y,t)
% i must be an odd number
% t must be an arithmetic progression
% if t is not odd, force it to be
% notice h 的下标不对
is_even = mod(length(t),2) == 0;
t = t(1:end-is_even);
y = y(:)';
h = t(3)-t(1);
n = length(t);
I = zeros(1,n);
I = [0,[1,4,1]*[y(1:2:n-2);y(2:2:n-1);y(3:2:n)]]*h/3;
end