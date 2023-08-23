function pos = paramfunfir(param_input,fixed)
a_x = param_input(3);
a_y = param_input(4);
xt0 = [param_input(5),param_input(6)];
tspan = [fixed(1),fixed(2)];
lengthData = fixed(3);
f = @(t,r) [1.266*r(1)*(1-r(1)/((1-0.538)*85.26))+a_x*r(1)*r(2);
            1.414*r(2)*(1-r(2)/((1-0.583)*106.31))+a_y*r(1)*r(2)];
[~,pos] = ode45(f,tspan,xt0);
 pos = pos(round(linspace(1,length(pos),lengthData)),:);