clc;clear all;close all
t=0:0.0001:1
x = 2*sin(2*pi*40*t)
m= square(2*pi*3*t)
v=x.*m
subplot(411)
plot(t,x)
subplot(412)
plot(t,m)
subplot(413)
plot(t,v)
z = v.*x
[num,den]=butter(2,0.01,'low')
m1=filter(num,den,z)
m2=filter(num,den,m1)
m3=filter(num,den,m2)
subplot(414)
plot(t,m3)