clear
[hun_uni,rect_hun_uni,right_hun_uni,between_hun_uni] = keeper_lower_Uniform(100);
subplot(2,2,1);
colour = right_hun_uni.*[1,0,0]+(1-right_hun_uni).*[0,0,1];
scatter(rect_hun_uni(:,1),rect_hun_uni(:,2),10,colour,"filled")
hold on
scatter(between_hun_uni(:,1),between_hun_uni(:,2),10,'b','filled')
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
title('The distribution of score and miss (Uniform distribution, N=100)')



[thou_uni,rect_thou_uni,right_thou_uni,between_thou_uni] = keeper_lower_Uniform(1000);
subplot(2,2,2);
colour = right_thou_uni.*[1,0,0]+(1-right_thou_uni).*[0,0,1];
scatter(rect_thou_uni(:,1),rect_thou_uni(:,2),10,colour,"filled")
hold on
scatter(between_thou_uni(:,1),between_thou_uni(:,2),10,'b','filled')
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
title('The distribution of score and miss (Uniform distribution, N=1000)')



[hun_gau,rect_hun_gau,right_hun_gau,between_hun_gau] = keeper_lower_Gaussian(100);
subplot(2,2,3);
colour = right_hun_gau.*[1,0,0]+(1-right_hun_gau).*[0,0,1];
scatter(rect_hun_gau(:,1),rect_hun_gau(:,2),10,colour,"filled")
hold on
scatter(between_hun_gau(:,1),between_hun_gau(:,2),10,'b','filled')
axis equal
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
title('The distribution of score and miss (Gaussian distribution, N=100)')



[thou_gau,rect_thou_gau,right_thou_gau,between_thou_gau] = keeper_lower_Gaussian(1000);
subplot(2,2,4);
colour = right_thou_gau.*[1,0,0]+(1-right_thou_gau).*[0,0,1];
scatter(rect_thou_gau(:,1),rect_thou_gau(:,2),10,colour,"filled")
hold on
scatter(between_thou_gau(:,1),between_thou_gau(:,2),10,'b','filled')
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
