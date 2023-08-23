function drawmod(data)
    len = length(data);
    plot(1:len,data(:,1),'Color','r',1:len,data(:,2),'Color','b',1:len,data(:,3),'Color',[0.8500 0.3250 0.0980],1:len,data(:,4),'Color',[0 0.4470 0.7410],1:len,data(:,5),'Color',[0.6350 0.0780 0.1840],1:len,data(:,6),'Color',[0.3010 0.7450 0.9330])
    legend('Amar data E' ,'Aris data E','Amar data E/2' ,'Aris data E/2','Amar data E/3' ,'Aris data E/3')
    legend('Location','east')
    xlabel('time')
    ylabel('number')
end