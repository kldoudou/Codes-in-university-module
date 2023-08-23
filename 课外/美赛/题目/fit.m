clear;clc;
load AA.mat
alpha_1 = 0.2; Rate_1 = 2; Rate_2 = 1; Env_1 = 20; Env_2 = 20; a = 0.1;


xt0 = zeros(1,7);
xt0(4) = alpha;
xt0(5) = a;
xt0(6:7) = soln(1,:);
tspan = [0,90];
pbest = lsqcurvefit(@paramfun,xt0,[tspan,length(soln)],soln);

fprintf('New parameters: %f, %f, %f, %f, %f\n',pbest(1:5))

fprintf('Original parameters: %f, %f, %f, %f, %f',[Rate_1,Rate_y,Env,alpha,a])

% soln = AA;
% xt0 = zeros(1,7);
% xt0(1) = Rate_x;
% xt0(2) = Rate_y;
% xt0(3) = Env;
% xt0(4) = alpha;
% xt0(5) = a;
% xt0(6:7) = soln(1,:);
% tspan = [0,90];
% [pbest,presnorm,presidual,exitflag,output] = lsqcurvefit(@paramfun,xt0,[tspan,length(soln)],soln);
% 
% fprintf('New parameters: %f, %f, %f, %f, %f\n',pbest(1:5))
% 
% fprintf('Original parameters: %f, %f, %f, %f, %f',[Rate_x,Rate_y,Env,alpha,a])