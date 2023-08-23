function [prob,rect,between] = simulation_Uniform(N)
%N个点撒进圆里,返回[落进去的概率,落在门里的坐标，落在球与门之间的坐标]
u = rand(N,1);
theta = rand(N,1).*(2*pi);
r = sqrt(u).*sqrt(5);
circle(:,1) = r.*cos(theta);
circle(:,2) = r.*sin(theta);
judgerect = (abs(circle(:,1))<2) & (abs(circle(:,2))<1);%判断是不是在长方形里面，返回一个logical矩阵（01矩阵）
rect = circle.*[judgerect(:),judgerect(:)];
between = circle - rect;
rect(~all(rect,2),:) = [];
between(~all(between,2),:) = [];%对于1的地方用红色，0的用蓝色
prob = sum(judgerect(:))/N;%算落进去的概率
end