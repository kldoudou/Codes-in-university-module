clear;clc;clf;
size = 100;
tspan = [0,10];
xt0 = [10;5];
Rate_x = 1.266;
Rate_y = 1.414;
alpha_x = 0.462;
alpha_y = 0.417;
Env_x = 85.26;
Env_y = 106.31;
a_x = 0;
a_y = 0.01;

f = @(t,r) [Rate_x*r(1)*(1-r(1)/(alpha_x*Env_x))+a_x*r(1)*r(2);
            Rate_y*r(2)*(1-r(2)/(alpha_y*Env_y))+a_y*r(2)*r(1)];
[t,r] = ode45(f,tspan,xt0);
r = r(round(linspace(1,length(r),size)),:);
noise = randn(size,1)*5;
stimulate_data = r+noise;
plot(1:100,stimulate_data(:,1),'bo')
hold on
plot(1:100,stimulate_data(:,2),'ko')