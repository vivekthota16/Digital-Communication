clc;close all
t=0:0.001:5
m=4*square(100*pi*t,50)
c=cos(1000*pi*t)
env=(1+0.2*m)
am=(1+0.2*m).*c
plot(t,am)
hold on
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