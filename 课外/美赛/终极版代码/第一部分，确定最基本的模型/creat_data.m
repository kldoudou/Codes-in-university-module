clear
clc
Rate_x = 0.25;
Rate_y = 0.8;
alpha_x = 0.538;
alpha_y = 0.583;
Env_x = 20;
Env_y = 20;
a_x = 0.01;
a_y = 0.01;
tspan = [0,5];
Constant = 1;

param(1) = Env_x;
param(2) = Constant;
param(3) = Rate_x;
known(1) = alpha_x;

data1 = [0,0,18,29,31,34,35,36,41,42,44];
data2 = [0,0,16,32,41,44,47,48,49,50,51];
rand = rand(1,11);
data = data2 + rand;


plot(data);