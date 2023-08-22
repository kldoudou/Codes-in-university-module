load("Q2_a.mat")
[a,b] = bisect(y);
tt = -y(a).*(t(b)-t(a))./...
    (y(b)-y(a))+t(a);
I = trapeze_eacht(y,t);
int_I = sigema(I)+500;
plot(t,int_I,'r','LineWidth',1)
title("The height changed by t")
xlabel("t(s)")
ylabel("H(t)(m)")
axis([0 8 400 600]);
max_height=max(int_I(a),int_I(b));