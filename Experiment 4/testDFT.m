clc
%clear all

Input = InputPicture();
% Input = zeros(2000,2000);
% mask = ones(10,10);
% Input(40:49,40:49) = mask;
tic
XY = myDFTforPicture(Input);
IXY = myIDFT2(XY,size(Input,1),size(Input,2));
XY_abs = abs(XY);
toc
figure
imshow(XY_abs,[])
figure
imshow(abs(IXY),[])
tic
xy = abs(fftshift(fft2(double(Input))));
toc
figure
imshow(xy,[])