plot(n,Ic_b,'Color',"#A2142F","LineWidth",1);
hold on
plot(n,Is_b,'Color',"#0072BD","LineWidth",1)
hold on
load 1_a.mat
plot(n,Ic_a,'--r',n,Is_a,'--b',"LineWidth",0.6);
axis([90 1010 0.5 1.9]);
title('Treat [0,h] as w(x)');
xlabel('Intervals numbers');
ylabel('Integral result');
legend('Ic_b','Is_b','Ic_a','Is_a','Location','East')
