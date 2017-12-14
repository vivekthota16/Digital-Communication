
t=0:0.0001:0.1
x= 10*cos(100*pi*t)
subplot(3,1,1)
plot(t,x)
y=cos(pi*1000*t)
subplot(3,1,2)
plot(t,y)
z=cos(pi*1000*t+50*sin(100*pi*t))
subplot(3,1,3)
plot(t,z)
figure
plot(t,z)
periodogram(z,[],4096,1000,'power','centered');
am=diff(z)
lengthC=10
fmdiodeout=am
for time_indx=1:lengthC
    if(fmdiodeout(time_indx)<0)
        fmdiodeout(time_indx)=0;
    end
end
[den,num]=butter(1,2*(100/1000))
fmdemod=filter(den,num,fmdiodeout)
for n=1:400
    fmdemod=filter(den,num,fmdemod)
end
figure
plot(fmdemod)
