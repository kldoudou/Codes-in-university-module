function points = addpts(points,add_index)
middle = linspace(points(add_index),points(add_index+4),9);
points = [points(1:add_index-1),middle,points(add_index+5:end)];
end