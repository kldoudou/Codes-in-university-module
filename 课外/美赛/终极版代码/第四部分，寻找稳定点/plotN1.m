% data = [360.87,437.92,399.62,182.75,147.24,106.5];
% name = {'erig dive','amar palm','tria port','spha laxa','erio poly','opun basi'};
% X = categorical(name);
% bar(X,data)


f = @(t,x1) 2.6*x1*(1-x1/((0.31)*523));
[t,pos] = ode45(f,[0 5],10);
plot(t,pos)
title('erig dive''s growth rate')
xlabel('time')
ylabel('number')