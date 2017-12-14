clc;clear all;
fm=10;fs=520;n=4;mp=6;
t=0:0.001:0.1
xs = mp*sin(2*pi*fm*t)
plot(xs,'r','linewidth',2);
delta = 0.5
hold on
xn=0
for i=1:length(xs)
    if xs(i)>xn(i)
        d(i)=1;
        xn(i+1)=xn(i)+delta
    else
        d(i)=0
        xn(i+1)= xn(i)-delta
    end
end
stairs(xn,'linewidth',1.5)
hold on
for i=1:d
    if d(i)>xn(i)
        d(i)=0
        xn(i+1)=xn(i)-delta
    else
        d(i)=1
        xn(i+1)=xn(i)+delta;
    end
end
plot(xn,'k','linewidth',2)