clear

[hun,rect_hun,right_hun,between_hun] = keeper_Gaussian(100);
subplot(2,1,1);
colour = right_hun.*[1,0,0]+(1-right_hun).*[0,0,1];
scatter(rect_hun(:,1),rect_hun(:,2),10,colour,'filled')%画图
hold on
scatter(between_hun(:,1),between_hun(:,2),10,'b','filled')%画图
axis equal;
legend('score','miss')
r = sqrt(5);
a = [-r, -r, 2*r, 2*r];
rectangle('Position',a,'Curvature',[1 1]); 
rectangle('Position',[-2 -1 2 2]);
rectangle('Position',[-2 -1 2 1]);
rectangle('Position',[-2 -1 1 1]);
rectangle('Position',[-2 -1 1 2]);
rectangle('Position',[-1 -1 2 2]);
rectangle('Position',[-1 -1 2 1]);
rectangle('Position',[1 -1 1 1]);
rectangle('Position',[1 -1 1 2]);
title('The distribution of score and miss (Gaussain distribution, N=100)')
fprintf("The probability when N is 100 = %.4f\n",hun);


[tho,rect_tho,right_tho,between_tho] = keeper_Gaussian(1000000);
subplot(2,1,2); 
colour = right_tho.*[1,0,0]+(ones(length(right_tho),1)-right_tho).*[0,0,1];
scatter(rect_tho(:,1),rect_tho(:,2),10,colour,'filled')%画图
hold on
scatter(between_tho(:,1),between_tho(:,2),10,'b','filled')%画图
axis equal;
legend('score','miss')
r = sqrt(5);
a = [-r, -r, 2*r, 2*r];
rectangle('Position',a,'Curvature',[1 1]); 
rectangle('Position',[-2 -1 2 2]);
rectangle('Position',[-2 -1 2 1]);
rectangle('Position',[-2 -1 1 1]);
rectangle('Position',[-2 -1 1 2]);
rectangle('Position',[-1 -1 2 2]);
rectangle('Position',[-1 -1 2 1]);
rectangle('Position',[1 -1 1 1]);
rectangle('Position',[1 -1 1 2]);
title('The distribution of score and miss (Gaussain distribution, N=1000)')
fprintf("The probability when N is 1000 = %.4f\n",tho);

