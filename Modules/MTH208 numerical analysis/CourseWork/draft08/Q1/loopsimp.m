function [Q,err,sort_interval] = loopsimp(f,tinterval,tol)
subs = [tinterval(1:end-1);tinterval(2:end)];
midpt = sum(subs)/2;
dif = diff(subs);
subs_mid = [subs(1,:); midpt; subs(2,:)];
Ssub = 1/6.*dif.*([1,4,1]*f(subs_mid));
Q = 0;
interval = [];
i=1;
while 1
    %calculate the error
    if isempty(subs)
        break;
    end
    midpt = sum(subs)/2;
    subs = reshape([subs(1,:); midpt; midpt; subs(2,:)],2,[]);
    dif = diff(subs);
    Sbig = Ssub;
    subs_mid = [subs(1,:); sum(subs)/2; subs(2,:)];
    Ssub = 1/6.*dif.*([1,4,1]*f(subs_mid));
    Ssub_accb = sum(reshape(Ssub,2,[]));
    err = abs(Sbig - Ssub_accb)/15;
    tol = tol/2;
    err_index = err < tol;
    suberr_index = reshape([err_index;err_index],1,[]);
    Q = Q + sum(Ssub_accb(err_index),'all');
    interval(:,i:i+sum(suberr_index)-1) = [subs(:,suberr_index)];
    i = i+sum(suberr_index);
    subs(:,suberr_index) = [];
    Ssub(:,suberr_index) = [];
end
[sort_interval(1,:),I] = sort(interval(1,:));
sort_interval(2,:) = interval(2,I);
end