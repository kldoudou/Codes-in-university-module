function I = simpson(f,n)
% n must be an even number
% f must be a vectorized
if mod(n,2)~=0
    warning...
    ("n must be a even number");
end
h = 1/n;
x = linspace(0,1,n+1);
I = f(0)+f(1)...
    +2*sum(f(x(3:2:n-1)))...
    +4*sum(f(x(2:2:n)));
I = I*h/3;
end
