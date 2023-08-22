function I = trapeze_eacht(y,t)
y = y(:)';
h = t(2)-t(1);
subinterval = [y(1:end-1);y(2:end)];
I = [0,[1,1]*subinterval*h/2];
end