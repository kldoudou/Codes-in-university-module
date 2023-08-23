clear;
clc;
clf;
f = @(x)[tanh(x)];
fplot(f)
grid on
ylabel('tanh(x)')