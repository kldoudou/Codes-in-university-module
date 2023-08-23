function I = trapez(f,pts,n)
% assume f is a vectorized function
if n~=3&&n~=5
    warning("wrong number of 3/5")
end
if length(pts)~=5
    warning("wrong length of points input")
end
a = pts(1);b = pts(end);
h = (b-a)/(n-1);
I = f(a) + f(b) + 2*f(pts(3));
I = I + (n==5)*2*(f(pts(2))+f(pts(4)));
I = I*h/2;
end % end of function trapez