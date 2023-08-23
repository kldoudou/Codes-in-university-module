function pos = paramfunsec(x,param_input)
param = max([x,param_input],[],2,'ComparisonMethod','abs');
Rate_x = param(1);
Rate_y = param(2);
alpha_x = param(3);
alpha_y = param(4);
Env_x = param(5);
Env_y = param(6);
a_x = param(7);
a_y = param(8);
tspan = [param(9),param(10)];
xt0 = [param(11),param(12)];
lengthData = param(13);
f = @(t,r) [Rate_x*r(1)*(1-r(1)/((1-alpha_x)*Env_x))-a_x*r(1)*r(2);
            Rate_y*r(2)*(1-r(2)/((1-alpha_y)*Env_y))-a_y*r(2)*r(1)];
[~,pos] = ode45(f,tspan,xt0);
 pos = pos(round(linspace(1,length(pos),lengthData)),:);