%load param_data.mat
name = {'erig dive','amar palm','tria port','spha laxa','erio poly','opun basi'};

h = heatmap(name,name,param_data);
h.Title = 'Interaction Coefficient';