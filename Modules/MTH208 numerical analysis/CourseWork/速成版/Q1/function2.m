function I = function2(f,a,b,n)
% assume f is a vectorized function
h = (b-a)/n;
x = linspace(a,b,n+1);
I = f(a+h) + f(b);
I = I + 2*sum(f(x(2:end-1)));
I = I*h/2;
I = I + 2.*sqrt(h);

end % end of function trapez