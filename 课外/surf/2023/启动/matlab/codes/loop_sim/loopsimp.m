function [Q,err,sort_interval] = loopsimp(f,a,b,tol)
subs = [a;b];
%初始第一次计算
midpt = sum(subs)/2;
dif = diff(subs);
subs_mid = [subs(1,:); midpt; subs(2,:)];%用来算Sab的
Ssub = 1/6.*dif.*([1,4,1]*f(subs_mid));
Q = 0;%积分大小
COUNT = 0;%计数器
interval = [];%寻找一下分块的区间
i=1;
while COUNT<1e5
    %calculate the error
    if isempty(subs)
        break;
    end
    midpt = sum(subs)/2;
    subs = reshape([subs(1,:); midpt; midpt; subs(2,:)],2,[]);%先划分Sac,跟Sbc,写成一串
    dif = diff(subs);
    Sbig = Ssub;
    subs_mid = [subs(1,:); sum(subs)/2; subs(2,:)];
    Ssub = 1/6.*dif.*([1,4,1]*f(subs_mid));%把子列的算出来
    %Ssub_accb = Ssub(1:end-1)+ Ssub(2:end);%这边有问题，数组的大小不对了
    Ssub_accb = sum(reshape(Ssub,2,[]));
    err = abs(Sbig - Ssub_accb)/15;
    tol = tol/2;
    err_index = err < tol;%把误差合适的那些下标取出来
    suberr_index = reshape([err_index;err_index],1,[]);
    Q = Q + sum(Ssub_accb(err_index),'all');
    COUNT = COUNT + sum(suberr_index);%计数器
    %interval = [interval, subs(:,suberr_index)];

    interval(:,i:i+sum(suberr_index)-1) = [subs(:,suberr_index)];
    i = i+sum(suberr_index);
    subs(:,suberr_index) = [];%把已经算好的区间删掉
    Ssub(:,suberr_index) = [];
end

[sort_interval(1,:),I] = sort(interval(1,:));
sort_interval(2,:) = interval(2,I);
end