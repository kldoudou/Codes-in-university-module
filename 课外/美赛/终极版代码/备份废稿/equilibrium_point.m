syms x1 x2 x3 x4 x5
ques = [1.1*x1*(1-x1/((0.5)*7))-0.1*x1*x2-0.6*x1*x3-0.2*x1*x4-0.7*x1*x5;
        1.2*x2*(1-x2/((0.5)*8))-0.2*x2*x1-0.5*x2*x3-0.3*x2*x4-0.6*x2*x5;
        1.3*x3*(1-x3/((0.5)*9))-0.3*x3*x1-0.4*x3*x2-0.4*x3*x4-0.5*x3*x5;
        1.4*x4*(1-x4/((0.5)*10))-0.4*x4*x1-0.3*x4*x2-0.5*x4*x3-0.4*x4*x5;
        1.5*x5*(1-x5/((0.5)*11))-0.5*x5*x1-0.2*x5*x2-0.6*x5*x3-0.3*x5*x4];
equ = ques == zeros(5,1);
S = solve(equ);
% fprintf('X is: %f, %f, %f, %f, %f, %f, %f, %f\n',S.x(end))
% fprintf('X is: %f\n',S.x(end))
% fprintf('Y is: %f\n',S.y(end))
% fprintf('Z is: %f\n',S.z(end))
% fprintf('M is: %f\n',S.m(end))
length(S.x1);
answer = [double(S.x1),double(S.x2),double(S.x3),double(S.x4),double(S.x5)];
disp(answer')
