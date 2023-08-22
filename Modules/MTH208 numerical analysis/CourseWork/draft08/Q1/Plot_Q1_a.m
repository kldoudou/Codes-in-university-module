plot(n,Ic_a,'r',n,Is_a,'b','LineWidth',1);
axis([90 1010 0.5 1.9]);
title('''ignoring'' the singularity');
xlabel('Intervals numbers');
ylabel('Integral result');
legend('Ic','Is','Location','East')