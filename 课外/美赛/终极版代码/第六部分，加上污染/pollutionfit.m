clear;clc;
load poll_death.mat
tspan = [0,10];
xt0 = [10,6];
L1 = 0.5;
L2 = 0.6;
size = length(stimulate_data);
param = [xt0(1);xt0(2);L1;L2];
fixed = [size;tspan(1);tspan(2)];
pbest = lsqcurvefit(@pollutionfun,param,fixed,stimulate_data);
stimulate = pollutionfun(pbest,fixed);
log = stimulate_data>0;
stimulate_data = stimulate_data.*log;
plot(1:size,stimulate_data(:,1),'ro',1:size,stimulate_data(:,2),'bo',1:size,stimulate(:,1),'r-',1:size,stimulate(:,2),'b-')
legend('Amar data','Aris data','Amar predict','Aris predict')
legend('Location','southeast')
xlabel('time')
ylabel('number')