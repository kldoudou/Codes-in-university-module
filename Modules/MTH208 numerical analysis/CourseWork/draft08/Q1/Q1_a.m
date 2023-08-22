n = 100:10:1000;
fc = @(x) cos(x)./sqrt(x);
fs = @(x) sin(x)./sqrt(x);
Ic_a = zeros(1,length(n));
Is_a = zeros(1,length(n));
index = 1;
for i = n
    Ic_a(index) = trapez_1a(fc,i);
    Is_a(index) = trapez_1a(fs,i);
    index = index+1;
end
save("1_a","Is_a","Ic_a");
fprintf('For n = 1000:\nIc_a is %.4f\nIs_a is %.4f\n',Ic_a(end),Is_a(end))