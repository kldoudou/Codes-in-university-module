function pos = pollutionfun(param_input,fixed)
size = fixed(1);
tspan = [fixed(2),fixed(3)];
xt0 = [param_input(1);param_input(2)];
L1 = param_input(3);
L2 = param_input(4);
f = @(t,r) [1.266*r(1)*(1-r(1)/((0.462)*85.26))+0*r(1)*r(2)-L1*t;
            1.414*r(2)*(1-r(2)/((0.417)*106.31))+0.01*r(2)*r(1)-L2*t];
[~,r] = ode45(f,tspan,xt0);
pos = r(round(linspace(1,length(r),size)),:);
end