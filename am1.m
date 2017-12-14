clc;clear all;close all
t=0:0.0001:0.2
m=4*cos(100*pi*t)
plot(t,m)
c=2+cos(1000*pi*t)
am=(2+m).*cos(1000*pi*t)
env =1*(2+m)
figure
plot(t,c)
figure
plot(t,am)
%periodogram(am,[],4096,1000,'power','centered');
hold on;
plot(t,env,'r',t,-env,'b')
for q=1:2000
    if(am(q)<0)
        am(q)=0
    end
end
[den,num]=butter(1,2*pi*0.025)
for i =1:200
    am =filter(den,num,am)
end
figure
plot(t,am)