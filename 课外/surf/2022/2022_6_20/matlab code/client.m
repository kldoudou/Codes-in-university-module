function client(str)
%send str message
client_ip = "127.0.0.1";
client_port = 55001;
tcpipClient = tcpclient(client_ip,client_port,"Timeout",30,"ConnectTimeout",30);
data=str;
%data = [1,2,3,4];
%whos data
write(tcpipClient,data);
clear tcpipClient;
echotcpip("off");
end