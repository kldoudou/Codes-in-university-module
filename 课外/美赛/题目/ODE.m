
alpha = 0.2;
Rate_x = 2;
Rate_y = 1;
Env = 20;
a = 0.1;
f = @(t,r) [Rate_x*r(1)*(1-r(1)/Env-alpha)-a*r(1)*r(2);
            Rate_y*r(2)*(1-r(2)/Env-alpha)-a*r(2)*r(1)];
xt0 = [1;1];
[~,r] = ode45(f,[0 10],xt0);     % Runge-Kutta 4th/5th order ODE solver
plot(r(:,1))
hold on
plot(r(:,2))