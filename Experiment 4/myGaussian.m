function Output = myGaussian(Xsize)
%���ɸ�˹����
dx = 0.1;    
x = -Xsize/2:dx:Xsize/2;
Output = exp(-pi*x.^2);