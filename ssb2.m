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
figure
plot(t,m)
figure
plot(t,upper)
vudemod=c.*upper
upper_hil=hilbert(upper)
upper_abs=abs(upper_hil)
upper_demod=upper_abs-mean(upper_abs)
figure
plot(t,upper_demod)