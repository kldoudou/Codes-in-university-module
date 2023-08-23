
syms x1 x2 x3 x4 x5 x6 real
load Log.mat
load param_data.mat
X = [x1;x2;x3;x4;x5;x6];
% Env = rand(1,6)*400+200;
%Env = [523,644,689,425,409,213];
Env = [523,644,689,325,209,53];
% param_data = randn(6);
% param_data = param_data - diag(param_data);
% X_com = (Log.*(abs(param_data)).*(X*X'))*ones(length(X),1);
X_com = (param_data.*(X*X'))*ones(length(X),1);
X_baic = [2.6*x1*(1-x1/((0.31)*Env(1)));
        1.9*x2*(1-x2/((0.32)*Env(2)));
        1.8*x3*(1-x3/((0.42)*Env(3)));
        1.3*x4*(1-x4/((0.57)*Env(4)));
        1*x5*(1-x5/((0.64)*Env(5)));
        0.7*x6*(1-x6/((0.5)*Env(6)))];
ques = X_baic + X_com;
equ = ques == zeros(length(X),1);
S = solve(equ);
length(S.x1);
answer = [double(S.x1),double(S.x2),double(S.x3),double(S.x4),double(S.x5),double(S.x6)];
answer(all(answer==0,2),:) = [];%把全0行删掉
answer(~all(answer>=0,2),:) = [];%把小于0的删掉
ansa = sta_dis(answer,Env);%要比较的距离
[M,I]=min(ansa);%找到最小元素
answerindex = answer(I,:)~=0;
disp(answerindex)
disp(sum(answerindex))
