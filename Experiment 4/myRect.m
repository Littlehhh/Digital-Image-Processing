function output = myRect(xsize,deltaN,constC)%
%%Rect function
%%2016 10 31
% clc
% clear all
% close all

Lx = xsize;%20;%mm
N = deltaN;%100;
dx = 1;%Lx/N;
c = constC; %2;
u = -Lx/2:dx:Lx/2;

[a,b] = size(u);
output =zeros(a,b);
output(abs(u)<=c) = 1/c;
% for i = 1:a;
%     for j = 1:b;
%         if abs(u(i,j)) <= c;
%             output(i,j) = 1/c;
%         else 
%             output(i,j) = 0;
%         end
%     end
% end
% 
% plot(u,output)
% axis([-10 10 0 1.5]);
% ffoutput = abs(fftshift(fft(output)));
% figure
% plot(u,ffoutput)
