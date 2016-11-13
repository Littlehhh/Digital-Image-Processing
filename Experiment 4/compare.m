clc
clear all
n = 1024;
x = 1:n;
tic
Y = fft(x);
toc
tic
% X = myFFTrecursion(x,n);
F=calc_fft(x);
toc
tic
Z = myDFT(x,n);
toc 