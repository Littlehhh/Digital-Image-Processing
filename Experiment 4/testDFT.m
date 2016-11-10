clc
clear all

Input = InputPicture();

XY = myDFTforPicture(Input);
XY_abs = abs(XY);
figure
imshow(XY_abs)

xy = abs(fftshift(fft2(double(Input))));
figure
imshow(xy)