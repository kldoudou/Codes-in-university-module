n = 100:100:1000;
fc = @(t) 2.*cos(t.*t);
fs = @(t) 2.*sin(t.*t);
Ic = zeros(1,length(n));
Is = zeros(1,length(n));
for i = 1:length(n)
    Ic(i) = function4(fc,0,1,n(i));
    Is(i) = function4(fs,0,1,n(i));
end
plot(n,[Ic;Is])
function I = function4(f,a,b,n)
% n must be an even number
% f must be a vectorized function
h = (b-a)/n;
x = linspace(a,b,n+1);
I = f(a)+f(b)+2*sum(f(x(3:2:n-1)))+4*sum(f(x(2:2:n)));
I = I*h/3;

end % end of function simpson