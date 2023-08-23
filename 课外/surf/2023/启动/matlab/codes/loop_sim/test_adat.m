clear;clc;f = @(x) 1./sqrt(x);
tic
for i=1:9
[Q,~] = adaptiveSimpson(f,eps,1,10.^(-i));
fprintf("tol = 1e-%d, actual err is %.4e\n",i,abs(2-2*sqrt(eps)-Q));
end
toc