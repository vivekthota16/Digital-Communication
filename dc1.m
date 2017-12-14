clc;clear all;close all;
fm =10
fs=520
n = input('Enter n-bit quantizer: ')
mp=6
t=0:0.001:0.1
x = mp*sin(2*pi*fm*t);
plot(x)
hold on
L=2^n
delta = (2*mp)/L
yd = delta*round(x/delta)
plot(yd)
hold on
e = yd-x
plot(e)