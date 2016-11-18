function XY = myDFT2(xy,M,N)
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
