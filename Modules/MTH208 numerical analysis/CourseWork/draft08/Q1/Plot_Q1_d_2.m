i = 4:30;
Q = 0.*i;
err = 0.1.^i;
for j = i
    Q(j-3) = Q1_d_AS(err(j-3));
end
plot(Q)
xlabel("error less than n (1e-n)")
ylabel("Integral")