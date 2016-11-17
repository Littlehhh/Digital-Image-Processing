function Output = myGaussian(Xsize)
%生成高斯函数
dx = 0.1;    
x = -Xsize/2:dx:Xsize/2;
Output = exp(-pi*x.^2);