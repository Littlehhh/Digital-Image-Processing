function Output = myGaussian2D(Xsize,Ysize)

X = myGaussian(Xsize);
Y = myGaussian(Ysize);
Output = X'*Y;