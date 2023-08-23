function data = randndata(length)
    randnum = (randn(1,length)*10-2);
    lower = (randnum >= 0);
    dellowrandnum = lower.*randnum+0.01;
    upper = (randnum <= 15);
    deluprandnum = upper.*dellowrandnum + (1-upper).*20;
    data = deluprandnum;
     plot(data,'k-');
end