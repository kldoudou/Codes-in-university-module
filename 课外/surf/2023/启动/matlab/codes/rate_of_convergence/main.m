f = @(x) x.^(-0.5);
[Q,errr,~] = loopsimp(f,0,1,1e-8);
plot(errr)