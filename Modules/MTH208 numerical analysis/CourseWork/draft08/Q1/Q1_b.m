n = 100:10:1000;
fc = @(x) cos(x)./sqrt(x);
fs = @(x) sin(x)./sqrt(x);
Ic_b = zeros(1,length(n));
Is_b = zeros(1,length(n));
index = 1;
for i = n
    Ic_b(index) = trapez_2a(fc,i);
    Is_b(index) = trapez_2a(fs,i);
    index = index+1;
end
save("1_b","Is_b","Ic_b");
fprintf('For n = 1000:\nIc_b is %.4f\nIs_b is %.4f\n',Ic_b(end),Is_b(end))