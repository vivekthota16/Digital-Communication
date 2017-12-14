clc;clear all;close all
t=0:0.0001:0.1
msg=(1+cos(2*pi*100*t))
carr =(1+square(2*pi*1500*t))/2;
pam=msg.*carr
subplot(311)
plot(t,msg)
subplot(312)
plot(t,carr)
subplot(313)
plot(t,pam)
periodogram(pam, [], 4096, 1000, 'power', 'centered');
figure
plot(t,pam)
for tim=1:106
    if(pam(tim)<0)
        pam(tim)=0
    end
end
[den,num]=butter(1,2*pi*0.025)
for i=1:20
    pam=filter(den,num,pam);
end
figure
plot(t,pam)