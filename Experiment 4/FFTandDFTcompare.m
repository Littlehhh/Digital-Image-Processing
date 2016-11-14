clc
clear all
n = 4096;
xn = ones(1,n);

tic
X = fft(xn);
toc

tic
XK = myFFT(xn);
toc
% tic
% XK2 = myFFTrecursion(xn,n);
% toc
% tic
% XK3 = myFFTsparsematix(xn);
% toc
tic
XK1 = myDFT(xn);
toc
