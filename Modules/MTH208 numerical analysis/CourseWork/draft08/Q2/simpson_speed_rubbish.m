function [I,index] = simpson_speed_rubbish(y,t)
% i must be an odd number
% t must be an arithmetic progression
h = t(2)-t(1);
n = length(t);
i = 3;
I = 0;
I_last_pos = y(1) > 0;
I_now_pos = I_last_pos;
while (I_last_pos == I_now_pos)
    if(i > n)
        warning("there is no max point")
    end
    I = I + h/3*(y(i-2) + 4 * y(i-1) + y(i));
    i = i + 2;
    I_last_pos = I_now_pos;
    I_now_pos = I > 0;
end
index = i-2;
end