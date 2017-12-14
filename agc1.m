clc;clear all;close all
t=0:0.001:1
m = heaviside(t-1)
c= cos(2*pi*15*t)
s=m.*c
x=awgn(s,5)
y=input('nter: ')
for i=1:length(t)
    g(i)=y/x(i)
    z(i)= x(i).*g(i);
end
plot(t,x)