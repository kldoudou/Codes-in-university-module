%% load data
load("Q2_a")
%% plot v(t)
plot(t,y,'b',"LineWidth",1);
xlabel("t(s)");ylabel("v(m/s)")
title("v(t)")
%% plot error
plot(err,'r',"LineWidth",1)
ax = gca;
ax.YScale = 'log';
xlabel("n");
ylabel("error")
title("error between h " + ...
    "and h/2 (h = 1/2^n)")