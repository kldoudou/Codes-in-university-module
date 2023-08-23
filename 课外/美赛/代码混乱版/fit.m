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

%{
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
xlabel('time')
ylabel('y_number')
%}

% load first_data.mat
% xt0 = first_data(1,:);
% lengthData = length(first_data);
% x = [Rate_x;Rate_y;Env_x;Env_y;xt0'];
% param_input = [0;0;alpha_x;alpha_y;0;0;a_x;a_y;tspan';0;0;lengthData];
% pbest = lsqcurvefit(@paramfunfir,x,param_input,first_data);
% Rate_x = pbest(1);
% Rate_y = pbest(2);
% Env_x = pbest(3);
% Env_y = pbest(4);
% xt0 = [pbest(5),pbest(6)];




% fprintf('New parameters: %f, %f, %f, %f\n',pbest(1:4))
% fprintf('Original parameters: %f, %f, %f, %f',[Rate_x,Rate_y,Env_x,Env_y])
tspan = [0,100];
xt0 = [2;5];
param = [1.266;1.414;0.538;0.583;85.26;106.31;0.1;-0.2;tspan(1);tspan(2);xt0(1);xt0(2)];
foreast = model(param);
plot(foreast);