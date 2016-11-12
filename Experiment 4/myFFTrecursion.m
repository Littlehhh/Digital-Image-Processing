function X = myFFTrecursion(x,n)
if n==2
    X = [1,1;1,-1] * x';
    X = X';
else
    xe = x(2:2:n);
    xo = x(1:2:n);
    k = 0:1:n/2-1;
    
    X(1:n/2) = myFFTrecursion(xe,n/2) + exp(-1i*2*pi*k/n) .* myFFTrecursion(xo,n/2);
    X(n/2+1:n) = myFFTrecursion(xe,n/2) - exp(-1i*2*pi*k/n) .*  myFFTrecursion(xo,n/2);
end
    

    
    
    