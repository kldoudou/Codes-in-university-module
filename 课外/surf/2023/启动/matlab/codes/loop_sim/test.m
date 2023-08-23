clear;clc;f = @(x) 1./sqrt(x);
%%
tic
[Q,~] = adaptiveSimpson(f,eps,1,1e-2);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-3);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-4);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-5);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-6);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-7);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-8);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-9);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-10);
disp(abs(2-Q))
[Q,~] = adaptiveSimpson(f,eps,1,1e-11);
disp(abs(2-Q))
toc
%%
tic
[Q,~] = loopsimp(f,eps,1,1e-2);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-3);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-4);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-5);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-6);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-7);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-8);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-9);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-10);
disp(abs(2-Q))
[Q,~] = loopsimp(f,eps,1,1e-11);
disp(abs(2-Q))
toc