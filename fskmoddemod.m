clc;clear all;close all
fm=10;fs=520;fc1=80;fc2=20
t=0:0.001:1
set(gcf,'color','w')
m=square(2*pi*fm*t)
c1= 2.*sin(2*pi*fc1*t)
c2= 2.*sin(2*pi*fc2*t)
subplot(511)
plot(t,c1)
subplot(512)
plot(t,c2)
subplot(513)
plot(t,m)
for i=1:length(m)
    if m(i)==1
        mod(i) = c1(i)
    else
        mod(i)=c2(i)
    end
end
subplot(514)
plot(t,mod)
s1=mod.*c1
s2=mod.*c2
[num,den]=butter(3,2*pi*(fm/fs))
e1=filter(num,den,s1)
e2=filter(num,den,s2)
for i=1:length(e1)
    if e1(i)>e2(i)
        demod(i)=1
    else
        demod(i)=0
    end
end
subplot(515)
stairs(demod)
