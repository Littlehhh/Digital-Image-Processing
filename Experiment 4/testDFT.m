clc
%clear all

% Input = InputPicture();
Input = zeros(2000,2000);
mask = ones(10,10);
Input(40:49,40:49) = mask;
tic
XY = myDFTforPicture(Input);
toc
XY_abs = abs(XY);
figure
imshow(XY_abs,[])
figure
imshow(abs(IXY),[])
tic
xy = abs(fftshift(fft2(double(Input))));
toc
figure
imshow(xy,[])