clc
clear all
close all
t = 0:0.00001:2;
f = 50;
y1 = sin(2*pi*f*t);
figure
plot(t,y1);
title('频率为50Hz');
f = 100;
y2 = sin(2*pi*f*t);
figure
plot(t,y2);
title('频率为100Hz');
Y = y1+y2;
figure
plot(t,Y);
title('两种正弦叠加');
F =fft(Y);
figure
plot(F)
title('Fourier变换后');
