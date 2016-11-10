function XY = myDFTforPicture(GrayPicture)


[M,N] = size(GrayPicture);
xy = double(GrayPicture);
XY = myDFT2(xy,M,N);
XY = fftshift(XY);

