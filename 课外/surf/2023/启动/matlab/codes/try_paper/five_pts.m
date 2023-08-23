function I = five_pts(f,a,b,ep)
points = linspace(a,b,5);
flag=0;
ind=1;%左探头
while flag == 0
    flag=1;
    for i = ind:length(points)-4
        pts = points(i:i+4);
        I3 = trapez(f,pts,3);
        I5 = trapez(f,pts,5);
        %err = abs(I5-I3)/I3;
        err = abs((I5-I3)/I3);
        if err > ep
           ind=i;
           points = addpts(points,i);
           flag=0;
           break
        end
    end
end
I = trapez_pts(f,points);
end