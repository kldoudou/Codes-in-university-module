f = @(t,v) -9.8-(0.002./0.11).*v.*abs(v);
h = 1;e=inf;
while e>1e-4
    [t,y] = rkstep(f,0,40,40./h,80);
    [tn,yn] = rkstep(f,0,40,40./h.*2,80);
    h = h/2;
    e = max(abs(yn(1:2:end)-y));
end
intf = griddedInterpolant(t,y);
conf = @(t) intf(t);
int = 0;
for i = 1:length(t)-1
    int = int + trapez(conf,t(i),t(i+1),1);
        if int<-500
           break;
        end
end
disp(t(i))%t(i)是最后落地时间