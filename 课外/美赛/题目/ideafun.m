function pos = ideafun(x,input)
tspan = [input(1),input(2)];
size = input(3);
Rate_x = x(1);
Rate_y = x(2);
Env_x = x(3);
Env_y = x(4);
xt0 = x(5:6);
f = @(t,r) [Rate_x*r(1)*(1-r(1)/Env_x);
            Rate_y*r(2)*(1-r(2)/Env_y)];
[~,pos] = ode45(f,tspan,xt0);
pos = pos(round(linspace(1,length(pos),size)),:);