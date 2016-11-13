clc
clear all

n = 8;
x = 0:n-1;
X = ones(1,n);
Wn = exp(-1i*2*pi*x/n);
%ÂëÎ»µ¹ÖÃ
B = dec2bin(x,log2(n));

C=fliplr(B);
xBRO = bin2dec(C);
deep = 0;
An = 0;
M=1;
A = 1;
N = n;
    while M<=n/2
   
        while deep<=M;
            if deep==0;
                base = eye(N/2);
                An = cat(2,cat(1,base ,Wn(xBRO(deep+1)+1)*base),cat(1,base,-Wn(xBRO(deep+1)+1)*base))            
            else
                base = eye(N/2);
                base = cat(2,cat(1,base ,Wn(xBRO(deep+1)+1)*base),cat(1,base,-Wn(xBRO(deep+1)+1)*base));
                An = blkdiag(An,base)
            end
            deep = deep+2
        end
        N = N/2;
        deep=0;
        A = An*A;
        M = 2*M
    end
XK = A*X';    
com = fft(X);
