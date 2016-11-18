clc
clear all
%����һ������ͼ
Input = zeros(512,512);
mask = ones(10,10);
Input(40:49,40:49) = mask;

tic
X=myFFT2(Input);%�Լ���FFT   ��-2
toc

tic
COM = fftshift(fft2(Input));%ϵͳ�Դ�
toc

tic
XY = myDFTforPicture(Input);%�Լ���DFT
X_abs = abs(XY);
toc

X = fftshift(X);
XY_abs = abs(X);
figure
imshow(XY_abs,[])
title('myFFT2 �任���õ���ͼ��');
figure
imshow(X_abs,[])
title('myDFT2 �任���õ���ͼ��');
figure
imshow(abs(COM),[])
title('fft2 �任���õ���ͼ��');