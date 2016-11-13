function X = myFFTrecursion(x,n)
%典型的分治法  divide-and-conquer method
if n==2
    X = [1,1;1,-1] * x';
    X = X';
else
    xEVEN = x(2:2:n);
    xODD = x(1:2:n);
    k = 0:1:n/2-1;
    
    X(1:n/2) = myFFTrecursion(xEVEN,n/2) + exp(-1i*2*pi*k/n) .* myFFTrecursion(xODD,n/2);
    X(n/2+1:n) = myFFTrecursion(xEVEN,n/2) - exp(-1i*2*pi*k/n) .*  myFFTrecursion(xODD,n/2);
end
    

    
    
    