intf = griddedInterpolant(t,y);
c
vvt = bisect(conf,0,20,1e-4,1000); %vvt is the v=0 times.
max_h = trapez(conf,0,vvt,4*1e4)+500;% max_h is the max height.