function int_I = sigema(I)
%int_I = cumsum(I);
int_I = 0.*I;
Q = 0;
for i = 1:length(I)
    Q = Q+I(i);
    int_I(i) = Q;
end
end