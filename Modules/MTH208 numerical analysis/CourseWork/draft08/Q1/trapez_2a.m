function I = trapez_2a(f,n)
% assume f is vectorized
h = 1/n;
% on [h,1]
x = linspace(0,1,n+1);
x = x(2:end);
I1 = f(x(1)) + f(x(end));
I1 = I1 + 2*sum(f(x(2:end-1)));
I1 = I1*h/2;
% on [0,h]
I0 = 2.*sqrt(h);
I = I0+I1;
end