clc;clear all;close all;
fm=10
fs=520
mp=4
t=0:0.001:0.2
xs=mp*sin(2*pi*fm*t)
xmax= max(xs)
xn = abs(xs)/xmax
A =[1 3 60];
z =zeros(length(A),length(xn))
for k=1:length(A)
    for i=1:length(xn)
        if((xn(i)>=0)&&(xn(i)<(1/A(k))))
            z(k,i)=(A(k)*xn(i))/(1+log(A(k)));
        elseif ((xn(i)>=1/A(k))&&(xn(i)<=1))
            z(k,i)=(1+log(A(k)*xn(i)))/(1+log(A(k)));
        end
    end
end
plot(xn,z/xmax,'Linewidth',2)
grid on;
legend('A=1','A=2','A=90');