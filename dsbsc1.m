clc;clear all;close all
fs=200
t=0:0.001:0.5
m= cos(20*pi*t)
c=cos(2*pi*50*t)
for i=1:length(t)
    if(c(i)>0)
        s(i)=m(i).*c(i)
   else
        s(i)= -m(i).*c(i)
    end
end
plot(t,s)