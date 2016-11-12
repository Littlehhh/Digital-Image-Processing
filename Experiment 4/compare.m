clc
clear all
n = 4096;
x = 1:n;
tic
Y = fft(x);
toc
tic
X = myFFTrecursion(x,n);
toc
tic
Z = myDFT(x,n);
toc 