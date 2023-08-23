clear;clc;
Rate_x = 1.5;
Rate_y = 1.8;
alpha_x = 0.538;
alpha_y = 0.583;
Env_x = 20;
Env_y = 20;
a_x = 0.01;
a_y = 0.01;
tspan = [0,5];
Constant = 1;


%拟合最开始的ERC
load randdata_y.mat
% xt0 = first_data(1);
lengthData = length(data);
param(1) = Env_x;
param(2) = Constant;
param(3) = Rate_x;
known(1) = alpha_x;
xdata = 1:11;
pbest = lsqcurvefit(@eyesol,param,xdata,data);
fprintf('New parameters: %f, %f, %f\n',pbest(1:3))
fprintf('Original parameters: %f, %f, %f\n',[Env_x,Constant,Rate_x])
plot(xdata,data,'ko',xdata,eyesol(pbest,1:11),'b-')
legend('Data','Best fit')
legend('Location','southeast')
xlabel('time')
ylabel('number')
title('Y regression')
