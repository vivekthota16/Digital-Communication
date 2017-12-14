clc;clear all;close all
fm=10
fc=100
t1=0:1/520:2/fm
t2=0:1/5200:2/fc
xm=(square(2*pi*fm*t1)+1)/2;
xc=sin(2*pi*fc*t2)
xo1=xm.*xc
subplot(411)
plot(t1,xm,'linewidth',2)
subplot(412)
plot(t2,xc,'linewidth',2)
subplot(413)
plot(t1,xo1,'linewidth',2)
xo2=xo1.*xc
[num,den]=butter(3,2*pi*fm/520,'LOW')
s1=filter(num,den,xo2)
thresh=(max(s1)+min(s1))/2
for k=1:length(s1)
    if s1(k)>thresh
        out(k)=1
    else
        out(k)=0
    end
end
subplot(414)
plot(t1,out,'linewidth',2)
