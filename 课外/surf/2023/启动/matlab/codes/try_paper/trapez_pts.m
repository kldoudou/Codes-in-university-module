function I = trapez_pts(f,pts)
% assume f is a vectorized function
h = diff(pts);% the height of trapezoid
y = f(pts);
u = y(1:end-1)+y(2:end);
I = u*h'*0.5;
end