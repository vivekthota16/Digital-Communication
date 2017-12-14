clc;clear all;close all;
fm=10
fs=520
n=4;mp=6
t=0:0.001:0.1
xs = mp*sin(2*pi*fm*t)
L = 2^n;
delta  = (2*mp)/L
xq = delta * round(xs/delta)
e = xq-xs
code = []
k =1
xqenc = xq + mp
for i= 1:length(xq)
    d = dec2bin(xqenc(i),n)
    for j= 1:n
        code(k)=d(j)-48
        k=k+1
    end
end
figure;
stem(t,xs,'m','linewidth',1)
title('Sampling and Quantization')
hold on
plot(t,xq,'linewidth',2)
hold on
plot(t,e,'k','linewidth',2)
legend('Sampled Signal','Quantized Signal','Quantizaation error')
figure
stairs(code)
grid on
title('PCM waveform')
g = length(xq)
axis([0 g -1 2])
qnt = reshape(code,n,(length(code)/n))
index = bi2de(qnt','left-msb')
in = ((index-mp)*delta)
[den,num]= butter(3,2*pi*fm/fs)
s1=filter(den,num,in)
figure
plot(t,xs,'k','linewidth',2)
hold on
plot(t,s1,'m','linewidth',2)
legend('Message signal','demodulated signal')
