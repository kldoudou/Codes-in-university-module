load("Q2_a.mat")
I = trapeze_eacht(y,t);
int_I = sigema(I);
[a,b] = bisect(int_I+500);
t_between=t([a,b]);
t_middle =sum(t_between)./2;
plot(t,int_I,'r','LineWidth',1)
title("The height changed by t")
xlabel("t(s)")
ylabel("H(t)(m)")