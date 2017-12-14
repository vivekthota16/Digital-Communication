clc;clear all;close all;
fc=1000;
fs=10000;
fm=200
t= 0:1/fs:(0.02)
mt=0.4*sin(2*pi*fm*t)+0.5
st=modulate(mt,fc,fs,'PPM')
dt=demod(st,fc,fs,'PPM');
figure
subplot(311)
plot(mt)
subplot(312)
plot(st)
subplot(313)
plot(dt)
