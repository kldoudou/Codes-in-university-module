function arg1 = rot2tar(curdeg,cur,tar)
%让飞机转到对准的角度需要转多少度（角度制）,正的说明向左转,负的说明向右转.
%curdeg是现在的角度朝向,角度制，cur是现在坐标，tar是目标坐标三维.
tar1=[tar(1,1);tar(3,1)];
cur1=[cur(1,1);cur(3,1)];
ABv=tar1-cur1;
ACv=[cos(deg2rad(curdeg)),sin(deg2rad(curdeg))];
arg=acos(dot(ABv,ACv)/(norm(ABv)*norm(ACv)));
if ACv(1,1)*ABv(2,1)<ACv(1,2)*ABv(2,1)
    arg1=rad2deg(arg);
else
    arg1=-rad2deg(arg);
end
end