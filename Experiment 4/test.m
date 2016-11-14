clc
clear all

% Input = InputPicture();
% Input = double(Input);
Input = zeros(1024,1024);
mask = ones(10,10);
Input(40:49,40:49) = mask;

% [M,N] = size(Input);
% X = zeros(M,N);
tic
X=myFFT2(Input);
toc

tic
COM = fftshift(fft2(Input));
toc

tic
XY = myDFTforPicture(Input);
X_abs = abs(XY);
toc
% 
X = fftshift(X);
XY_abs = abs(X);
figure
imshow(XY_abs,[])
figure
imshow(X_abs,[])
figure
imshow(abs(COM),[])