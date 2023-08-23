function draw_model(data)
    len = length(data);
    plot(1:len,data(:,1),'r-',1:len,data(:,2),'b-')
    legend('Amar data','Aris data')
    legend('Location','east')
    xlabel('group')
    ylabel('number')
end