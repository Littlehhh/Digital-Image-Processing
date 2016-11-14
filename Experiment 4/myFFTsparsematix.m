function XK = myFFTsparsematix(X)
n = length(X);
if log2(n)

x = 0:n-1;
Wn = exp(-1i*2*pi*x/n);
%ÂëÎ»µ¹ÖÃ
B = dec2bin(x,log2(n));
C=fliplr(B);
xBRO = bin2dec(C)+1;
deep = 1;
An = 0;
A = 1;
N = n;
M = 1;
    while N>1
   
        for i = 1:M;
            if deep==1;
                base = eye(N/2);
                An = cat(1,cat(2,base ,base),cat(2,base,-base));          
            else
                base = eye(N/2);
                base = cat(1,cat(2,base ,Wn(xBRO(deep))*base),cat(2,base,-Wn(xBRO(deep))*base));
                An = blkdiag(An,base);
            end
            deep = deep+2;
        end
        M = M*2;
        N = N/2;
        deep=1;
        A = An*A;
    end
    
XBRO = A*X.';
XK = zeros(1,n);
for i=1:n;
     XK(i) = XBRO(xBRO(i));
end

