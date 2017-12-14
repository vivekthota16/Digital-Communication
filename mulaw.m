clc;clear all;close all
fm=10
fs=520
mp=4
t=0:0.001:0.2
xs =mp*sin(2*pi*fm*t)
xmax = max(xs)
xn= abs(xs)/xmax
u=input('enter the u value')
zx = log(1+u*xn)/(log(1+u))
figure;
plot(t,xs,'m','linewidth',1)
title('Input signal');
hold on
plot(t,xn)
figure;
plot(xn,zx,'linewidth',2);
