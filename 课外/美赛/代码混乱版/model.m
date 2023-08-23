function [t,pos] = model(param_input)
Rate_x = param_input(1);
Rate_y = param_input(2);
alpha_x = param_input(3);
alpha_y = param_input(4);
Env_x = param_input(5);
Env_y = param_input(6);
a_x = param_input(7);
a_y = param_input(8);
tspan = [param_input(9),param_input(10)];
xt0 = [param_input(11),param_input(12)];
%lengthData = param_input(13);
f = @(t,r) [Rate_x*r(1)*(1-r(1)/((1-alpha_x)*Env_x))-a_x*r(1)*r(2);
            Rate_y*r(2)*(1-r(2)/((1-alpha_y)*Env_y))-a_y*r(2)*r(1)];
[t,pos] = ode45(f,tspan,xt0);
 %pos = pos(round(linspace(1,length(pos),lengthData)),:);