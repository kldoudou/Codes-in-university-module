function pos = competefun(param_input,fixed)
size = fixed(1);
tspan = [fixed(2),fixed(3)];
xt0 = [param_input(1);param_input(2)];
a_x = param_input(3);
a_y = param_input(4);
f = @(t,r) [1.266*r(1)*(1-r(1)/((1-0.538)*85.26))+a_x*r(1)*r(2);
            1.414*r(2)*(1-r(2)/((1-0.583)*106.31))+a_y*r(2)*r(1)];
[~,r] = ode45(f,tspan,xt0);
pos = r(round(linspace(1,length(r),size)),:);
end