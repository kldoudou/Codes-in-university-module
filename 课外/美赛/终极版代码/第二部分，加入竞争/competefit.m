clear;clc;
load stimulate_data.mat
tspan = [0,10];
xt0 = [10,6];
a_x = 0.03;
a_y = 0.02;
size = length(stimulate_data);
param = [xt0(1);xt0(2);a_x;a_y];
fixed = [size;tspan(1);tspan(2)];
pbest = lsqcurvefit(@competefun,param,fixed,stimulate_data);
stimulate = competefun(pbest,fixed);
log = stimulate_data>0;
stimulate_data = stimulate_data.*log;
plot(1:size,stimulate_data(:,1),'ro',1:size,stimulate_data(:,2),'bo',1:size,stimulate(:,1),'r-',1:size,stimulate(:,2),'b-')
legend('Amar data','Aris data','Amar predict','Aris predict')
legend('Location','southeast')
xlabel('time')
ylabel('number')