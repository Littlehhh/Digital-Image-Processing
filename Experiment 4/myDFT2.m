function XY = myDFT2(xy,M,N)
% N = 10;
% M = 10;
% 
% xy = ones(M,N);

u = 0:M-1;
x = 0:M-1;

v = 0:N-1;
y = 0:N-1;

WM = exp(-1i*2*pi/M);
ux = u'*x;
WMnk = WM .^ux;

WN = exp(-1i*2*pi/N);
vy = v'*y;
WNnk = WN .^vy;

XY = WMnk * xy * WNnk;
% XY(XY<1e-10) = 0;
% result = fft2(xy)
