f = @(t,v) -9.8-0.002/0.11*v.*abs(v);
k = 1:100;n = 20.*2.^k;
err = inf(1,length(n));
FIRSTTIME = true;
for i = k
    [t, y] = eulerstep(f,0,20,n(i),80);
    if FIRSTTIME == true
        last_t=t;last_y=y;
        FIRSTTIME = false;
        continue
    else
        err(i-1) = max(abs( ...
            y(1:2:end)- last_y));
        if(err(i-1)<1e-4)
            t=last_t;y=last_y;
            err(i:end) = [];
            break
        end
        last_t=t;last_y=y;
    end
end
save("Q2_a",'t','y','err')