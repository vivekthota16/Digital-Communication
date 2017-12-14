clc;clear all;close all;
x= 0:0.5:4*pi;
sig1= 8*sin(x)
len = length(sig1)
sig2 = 8*triang(len);
subplot(221)
plot(sig1)
subplot(222)
plot(sig2)
subplot(223)
stem(sig1)
subplot(224)
stem(sig2)
for i=1:len
    sig(1,i)=sig1(i)
    sig(2,i)=sig2(i)
end
tdmsig=reshape(sig,1,2*len)
figure
stem(tdmsig)
demux = reshape(tdmsig,2,len)
for i=1:len
    sig3(i)=demux(1,i)
    sig4(i)=demux(2,i)
end
figure
subplot(211)
plot(sig3)
subplot(212)
plot(sig4)