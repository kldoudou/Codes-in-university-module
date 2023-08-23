function I = simpson(f,pts,n)
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
I = I + (n==5)*4*(f(pts(2))+f(pts(4)))+(n==3)*2*(f(pts(3)));
I = I*h/3;
end % end of function simpson