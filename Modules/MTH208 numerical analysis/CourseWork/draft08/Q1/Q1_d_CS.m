n = 100:10:1000;
fc = @(t) 2.*cos(t.^2);
fs = @(t) 2.*sin(t.^2);
Ic_d = zeros(1,length(n));
Is_d = zeros(1,length(n));
index = 1;
for i = n
    Ic_d(index) = simpson(fc,i);
    Is_d(index) = simpson(fs,i);
    index = index+1;
end