n = 100:100:1000;
fc = @(x) cos(x)./sqrt(x);
fs = @(x) sin(x)./sqrt(x);
Ic = zeros(1,length(n));
Is = zeros(1,length(n));
for i = 1:length(n)
    Ic(i) = function2(fc,0,1,n(i));
    Is(i) = function2(fs,0,1,n(i));
end
plot(n,[Ic;Is])
function I = function2(f,a,b,n)
% assume f is a vectorized function
h = (b-a)/n;
x = linspace(a,b,n+1);
I = f(a+h) + f(b);
I = I + 2*sum(f(x(3:end-1)));
I = I*h/2;
I = I + 2.*sqrt(h);

end % end of function trapez