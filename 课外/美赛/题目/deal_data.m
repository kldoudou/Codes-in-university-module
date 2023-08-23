clear;clc;
load heat_data.mat
cor = corrcoef(heat_data);
x_y_values = {'bout aris','erio aber','hapl grac'};
heatmap(x_y_values,x_y_values,cor)