function Xk = myDFT(xn,N)
% N = 10;
% xn = 1:N;

n = 0:N-1;
k = 0:N-1;
WN = exp(-1i*2*pi/N);
nk = n'*k;
WNnk = WN .^nk;

Xk = xn * WNnk;
%  xk = fft(xn);


