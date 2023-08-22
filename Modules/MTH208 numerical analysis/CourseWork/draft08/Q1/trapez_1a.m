function I = trapez_1a(f,n)
% assume f is a vectorized function
h = 1/n;
x = linspace(0,1,n+1);
%let f(0)=0
I = 0 + f(1);
I = I + 2*sum(f(x(2:end-1)));
I = I*h/2;
end