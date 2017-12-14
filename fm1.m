Fs = 10e3;
t = 0:1/Fs:.1-1/Fs;
m = sin(2*pi*100*t)
ac= cos(2*pi*900*t)
dsbsc=m.*ac;
plot(t,m); 
x=dsbsc.*cos(2*pi*1000*t)
% Plot annotations.
grid
xlabel('Time')
ylabel('Amplitude')
title('Message Signal m[n]')
periodogram(m, [], 4096, Fs, 'power', 'centered');

% Let's zoom into the area of interest.
ylim([-75,12]);

figure
plot(t,dsbsc);
periodogram(dsbsc, [], 4096, Fs, 'power', 'centered');
ylim([-75,12]);
r=1000;
c=1.59*power(10,-9)
h=(1/(r*c))*exp(-t/(r*c));
y=conv(x,h)
figure
plot(y)
figure
plot(t,m)