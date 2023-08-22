n = 100:10:1000;
fc = @(t) 2.*cos(t.^2);
fs = @(t) 2.*sin(t.^2);
Ic_c = zeros(1,length(n));
Is_c = zeros(1,length(n));
index = 1;
for i = n
    Ic_c(index) = trapez_3a(fc,i);
    Is_c(index) = trapez_3a(fs,i);
    index = index+1;
end
save("1_c","Is_c","Ic_c");
fprintf('For n = 1000:\nIc_c is %.4f\nIs_c is %.4f\n',Ic_c(end),Is_c(end))