load("1_b.mat")
load("1_a.mat")
%plot
plot(n,Ic_c,'Color',"#D95319","LineWidth",1)
hold on
plot(n,Is_c,'Color',"#4DBEEE","LineWidth",1)
hold on
plot(n,Ic_b,'--','Color',"#A2142F","LineWidth",0.5);
hold on
plot(n,Is_b,'--','Color',"#0072BD","LineWidth",0.5)
hold on
plot(n,Ic_a,'--r',n,Is_a,'--b',"LineWidth",0.5);
axis([90 1010 0.5 1.9]);
title('Change variables x = t^2');
xlabel('Intervals numbers');
ylabel('Integral result');
legend('Ic_c','Is_c','Ic_b','Is_b','Ic_a','Is_a','Location','East')