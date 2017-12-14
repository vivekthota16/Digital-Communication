clc;clear all;close all;
t=0:0.0001:0.1
m=cos(100*pi*t)
c=cos(1000*pi*t)
for i=1:1000
    if(m(i)>0)
        m(i)=0;
    end
end
plot(t,m)
y=m.*c
figure
plot(t,y)