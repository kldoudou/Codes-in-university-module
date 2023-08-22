fc = @(x) cos(x)./sqrt(x);
fs = @(x) sin(x)./sqrt(x);
true_fc = integral(fc,0,1,"AbsTol",1e-15);
true_fs = integral(fs,0,1,"AbsTol",1e-15);
save("true_data","true_fs","true_fc")