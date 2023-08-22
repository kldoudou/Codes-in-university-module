load("1_c.mat");
subplot(2,2,1);plot(n,Ic_d);title("Composite Simpson of Ic");
subplot(2,2,2);plot(n,Ic_d,n,Ic_c);title("Compare Ic_c and Ic_d");
subplot(2,2,3);plot(n,Is_d);title("Composite Simpson of Is");
subplot(2,2,4);title("Compare Is_c and Is_d");plot(n,Is_d,n,Is_c);