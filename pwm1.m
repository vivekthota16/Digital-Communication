clc;clear all;close all;
t=0:0.001:2
s=sawtooth(20*pi*t+pi);
m=0.75*sin(2*pi*1*t)
n=length(s);
for i=1:n
    if(m(i)>=s(i))
        pwm(i)=1;
    elseif(m(i)<=s(i))
            pwm(i)=0;
        end
    end
    subplot(211);plot(t,m,'-r',t,s,'-b');%axis([0 2 -1.5 1.5]);
    subplot(212)
    plot(t,pwm,'-k')
    %axis([0 2 -0.5 1.5])