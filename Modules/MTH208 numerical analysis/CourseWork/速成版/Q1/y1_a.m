n = 100:100:1000;
fc = @(x) cos(x)./sqrt(x);
fs = @(x) sin(x)./sqrt(x);
Ic = zeros(1,length(n));
Is = zeros(1,length(n));
for i = 1:length(n)
    Ic(i) = function1(fc,0,1,n(i));
    Is(i) = function1(fs,0,1,n(i));
end
plot(n,[Ic;Is])
function I = function1(f,a,b,n)
% assume f is a vectorized function
h = (b-a)/n;
x = linspace(a,b,n+1);
I = 0 + f(b);
I = I + 2*sum(f(x(2:end-1)));
I = I*h/2;

end % end of function trapez