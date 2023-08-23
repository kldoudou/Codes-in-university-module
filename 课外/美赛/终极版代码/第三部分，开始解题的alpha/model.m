function [t,number] = model(P,T,xt0)
alpha_x = alphafun(P,T,'amar');
alpha_y = alphafun(P,T,'aris');
f = @(t,r) [1.266.*r(1).*(1-r(1)./(alpha_x.*85.26))+0.*r(1).*r(2);
            1.414.*r(2).*(1-r(2)./(alpha_y.*106.31))+0.1.*r(2).*r(1)];
[t,number] = ode45(f,[0,1,2],xt0);
end