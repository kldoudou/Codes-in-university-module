function I = trapez_3a(f,n)
% assume f is vectorized
h = 1/n;
x = linspace(0,1,n+1);
I = f(x(1)) + f(x(end));
I = I + 2*sum(f(x(2:end-1)));
I = I*h/2;
end