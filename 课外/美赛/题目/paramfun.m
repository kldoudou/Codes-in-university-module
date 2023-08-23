function pos = paramfun(x,input)
tspan = [input(1),input(2)];
size = input(3);
Rate_x = input(4);
Rate_y = input(5);
Env_x = input(6);
Env_y = input(7);
alpha = x(4);
a = x(5);
xt0 = x(6:7);
f = @(t,r) [Rate_x*r(1)*(1-r(1)/Env_x-alpha)-a*r(1)*r(2);
            Rate_y*r(2)*(1-r(2)/Env_y-alpha)-a*r(2)*r(1)];
[~,pos] = ode45(f,tspan,xt0);
pos = pos(round(linspace(1,length(pos),size)),:);