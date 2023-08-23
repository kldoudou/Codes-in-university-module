clear;clc;
days = 33;
% P = randndata(days+10);
% T = randndata(days+10);
load true_data.mat
P = truedata(:,1);
T = truedata(:,1);
pos = [2,6];
num = zeros(days,2);
for t = 1:days
    num(t,:) = pos(end,:);
    [time,pos] = model(P(t),T(t),num(t,:));
end
draw_model(num);