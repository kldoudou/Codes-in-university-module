n = 100:100:1000;
fc = @(t) 2.*cos(t.*t);
fs = @(t) 2.*sin(t.*t);
Ic = zeros(1,length(n));
Is = zeros(1,length(n));
for i = 1:length(n)
    Ic(i) = function3(fc,0,1,n(i));
    Is(i) = function3(fs,0,1,n(i));
end
plot(n,[Ic;Is])
function I = function3(f,a,b,n)
% assume f is a vectorized function
h = (b-a)/n;
x = linspace(a,b,n+1);
I = f(a) + f(b);
I = I + 2*sum(f(x(2:end-1)));
I = I*h/2;
end % end of function trapez