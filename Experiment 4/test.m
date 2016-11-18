clc
clear all
%生成一个矩形图
Input = zeros(512,512);
mask = ones(10,10);
Input(40:49,40:49) = mask;

tic
X=myFFT2(Input);%自己的FFT   基-2
toc

tic
COM = fftshift(fft2(Input));%系统自带
toc

tic
XY = myDFTforPicture(Input);%自己的DFT
X_abs = abs(XY);
toc

X = fftshift(X);
XY_abs = abs(X);
figure
imshow(XY_abs,[])
title('myFFT2 变换所得到的图像');
figure
imshow(X_abs,[])
title('myDFT2 变换所得到的图像');
figure
imshow(abs(COM),[])
title('fft2 变换所得到的图像');