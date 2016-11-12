

n = 4;
x = 0:n-1;

Wn = exp(-1i*2*pi/n);

B = dec2bin(x,log2(n));
%ÂëÎ»µ¹ÖÃ
C = B(2:-1:1);
BRO = bin2dec(C);