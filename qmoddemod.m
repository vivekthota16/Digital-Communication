clc;clear all;close all;
t=0:0.01:1
fc=5
msg=[0 1 0 0 1 0 1 1]
for i=1:length(msg)
    if(msg(i)==0)
        msg(i)=-1;
    end
end
k=1
d1=[]
d2=[]
for i=1:2:length(msg)
    d1(k)=msg(i);
    d1(k+1)=msg(i);
    k=k+2;
end
k=1
for i=2:2:length(msg)
    d2(k)=msg(i);
    d2(k+1)=msg(i)
    k=k+2
end
c1=cos(2*pi*fc*t)
c2=sin(2*pi*fc*t)
odd=[]
even=[]
m=1
for i=1:length(d1)
    for k=1:length(c1)
        qpsk_odd(m)=d1(i)*c1(k);
        m=m+1;
    end
end
m=1
for i=1:length(d2)
    for k=1:length(c2)
        qpsk_even(m)=d2(i)*c2(k);
        m=m+1;
    end
end
qpsk=[]
for i=1:length(qpsk_odd)
    qpsk(i)=qpsk_even(i)+qpsk_odd(i);
end
figure
set(gcf,'color','white')
subplot(411)
stem(msg)
subplot(412)
stem(d1)
subplot(413)
plot(t,c1,'LineWidth',2)
subplot(414)
plot(qpsk_odd,'LineWidth',2)
figure
set(gcf,'color','white')
subplot(411)
stem(msg)
subplot(412)
stem(d2)
subplot(413)
plot(t,c2,'LineWidth',2)
subplot(414)
plot(qpsk_even,'LineWidth',2)
figure
set(gcf,'color','white')
subplot(311)
plot(qpsk_odd,'LineWidth',2)
subplot(312)
plot(qpsk_even,'LineWidth',2)
subplot(313)
plot(qpsk,'LineWidth',2)
lc1=length(c1)
A=[]
for i=1:8
    if sum(c1.*qpsk(1+lc1*(i-1):lc1*i))>0.5
        A=[A 1];
    else
        A=[A 0];
    end
end
lc2=length(c2)
B=[]
for i=1:8
    if sum(c2.*qpsk(1+lc2*(i-1):lc2*i))>0.5
        B=[B 1];
    else
        B=[B 0];
    end
end
demodout=[]
k=1
for i=1:2:length(msg)
    demodout(k)=A(i);
    demodout(k+1)=B(i);
    k=k+2
end
figure
set(gcf,'color','white')
subplot(211)
stairs(msg)
subplot(212)
stairs(demodout)
