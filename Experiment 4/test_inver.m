clc
clear all

n = 1024;
x = 0:n-1;
X = 1:n;
tic
B = dec2bin(x,log2(n));
C=fliplr(B);
xBRO = bin2dec(C)+1;

XK = zeros(1,n);
for i=1:n;
     XK(i) = X(xBRO(i));
end
toc
N=length(x);
tic
Fant=zeros(1,n);
M=N/2;
desp=0;
while M>1
    while desp <N
        for i=0:M-1                                    
            Fant(i+desp+1)=X(2*i+desp+1);       
            Fant(i+M+desp+1)=X(2*i+1+desp+1);    
        end
        desp=desp+2*M;
    end
    X=Fant;
    desp=0;
    M=M/2;
end
toc