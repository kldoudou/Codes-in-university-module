function [t,r] = completestimu(param_input)
xt0 = [param_input(1);param_input(2)];
a_x = param_input(3);
a_y = param_input(4);
f = @(t,r) [1.266*r(1)*(1-r(1)/((0.462)*85.26))+a_x*r(1)*r(2);
            1.414*r(2)*(1-r(2)/((0.417)*106.31))+a_y*r(2)*r(1)];
[t,r] = ode45(f,[0,10],xt0);
end