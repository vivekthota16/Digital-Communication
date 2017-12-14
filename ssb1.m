clc;clear all;close all;
t=0:0.0001:0.04;
m= cos(pi*100*t)
mp=sin(pi*100*t)
c=cos(pi*1000*t)
cp=sin(pi*1000*t)
ss1=m.*c
ss2=mp.*cp
upper=ss1-ss2
lower=ss1+ss2
vudemod=c.*upper
[b, a]=butter(2,0.002)
upperdemod=filter(b,a,vudemod)
figure
plot(t,m)
figure
plot(t,lower)

vfupper=abs(fft(upper,10000))/10000
figure
plot(vfupper)
vflower=abs(fft(lower,10000))/10000
figure
plot(vflower)