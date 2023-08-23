clear;clc;
addpath (genpath('codes'))
arr = 1:8;
f = @(x) 1./sqrt(x);
real_Q = 2-2*sqrt(eps);
%% simpson
Simpson_time = zeros(length(arr),1);
I = zeros(length(arr),1);
for i = arr
    tol = 10.^(-i);
    I(i) = adapsimpson(f,eps,1,tol);
    
    start_adapt = tic;
        for j = 1:100
            adapsimpson(f,eps,1,tol);
        end
    Simpson_time(i) = toc(start_adapt)./100;
end
Simpson_error = abs(I-real_Q);
%plot(I);
%plot(time_adapt);
%hold on
%% loopsimp no 向量化
loop1_time = zeros(length(arr),1);
I_loop = zeros(length(arr),1);
for i = arr
    tol = 10.^(-i);
    I_loop(i) = adaptiveSimpson(f,eps,1,tol);
    start_adapt = tic;
        for j = 1:100
            adaptiveSimpson(f,eps,1,tol);
        end
    loop1_time(i) = toc(start_adapt)./100;
end
loop1_error = abs(I_loop-real_Q);
%plot(I);
%plot(time_loop);
%% loopsimp with 向量化
loop2_time = zeros(length(arr),1);
I_loop_2 = zeros(length(arr),1);
for i = arr
    tol = 10.^(-i);
    I_loop_2(i) = loopsimp(f,eps,1,tol);
    start_adapt = tic;
        for j = 1:100
            loopsimp(f,eps,1,tol);
        end
    loop2_time(i) = toc(start_adapt)./100;
end
loop2_error = abs(I_loop-real_Q);
%plot(I);
%plot(time_loop_2);
%% plot
% subplot(2,1,1)
% plot([err_adapt,err_loop,err_loop_2])
% subplot(2,1,2)
plot([Simpson_time,loop1_time,loop2_time],'LineWidth',2);
set(gca,'YScale','log')
legend({'Simpson time','loop1 time','loop2 time'}, 'Location','northwest')
xlabel('Tolerance (\times10^{-1})')
ylabel('Time cost for each computation (s)')
%% plot2
bar([Simpson_error,loop1_error,loop2_error])
set(gca,'YScale','log')
legend({'Simpson error','loop1 error','loop2 error'}, 'Location','northeast')
xlabel('Tolerance (\times10^{-1})')
ylabel('Error (s)')
%% =================================
%% five_pts
time_five = zeros(length(arr(1:4)),1);
I_five = zeros(length(arr(1:4)),1);
for i = arr(1:4)
    tol = 10.^(-i);
    I_five(i) = five_pts(f,eps,1,tol);
    start_adapt = tic;
        for j = 1:100
            five_pts(f,eps,1,tol);
        end
    time_five(i) = toc(start_adapt)./100;
end
err_five = abs(I_five-real_Q);