f = @(t,v) -9.8-(0.002./0.11).*v.*abs(v);
h = 1;e=inf;
while e>1e-4
    [t,y] = rkstep(f,0,20,20./h,80);
    [tn,yn] = rkstep(f,0,20,20./h.*2,80);
    h = h/2;
    e = max(abs(yn(1:2:end)-y));
end
plot(t,y)