N = 1024;
fs = 2048;
t = (0:N-1)/fs;
fc = 600; %Carrier frequency !! Limit fc<800 to avoid freqdomain aliasing
fm1 = 200;
fm2 = 100;
Em1 = 2;
Em2 = 2;

m = Em1*cos(2*pi*fm1*t)+Em2*cos(2*pi*fm2*t); %Message
mh = imag(hilbert(m)); %Hilbert transform of the message signal

sbu = m.*2.*cos(2*pi*fc*t) - mh.*2.*sin(2*pi*fc*t);  %Expression for USB SSB
sbl = m.*2.*cos(2*pi*fc*t) + mh.*2.*sin(2*pi*fc*t);  %Expression for LSB SSB
SBU = 2/N*abs(fft(sbu));
SBL = 2/N*abs(fft(sbl));

freq = fs * (0 : N/2) / N; 
clc;
display('Single SideBand Modulation');
sprintf('Carrier frequency: %d Hz',fc)
sprintf('Message frequency: %d Hz and %d Hz',fm1,fm2)
sprintf('USB spectra at: %d Hz and %d Hz',fc+fm1,fc+fm2)
sprintf('LSB spectra at: %d Hz and %d Hz',fc-fm1,fc-fm2)

close all;
subplot(211);
plot(10*t(1:200),sbu(1:200),'b'); %Time Domain Plot
title('Time Domain Representation');
xlabel('Time'); ylabel('Modulated Signal');

subplot(212);
plot(freq,SBU(1:N/2+1),freq,SBL(1:N/2+1)); %Frequency domain plot
title('Frequency Domain Representation');
xlabel('Frequency(Hz)'); ylabel('Spectral Magnitude');
legend('USB','LSB');

