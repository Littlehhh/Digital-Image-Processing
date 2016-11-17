function Out = myFraunhofer_diffraction(Input,lamda,z)
%夫琅和费衍射
%z为传播距离
lamda = lamda/1000000;
k = 2*pi/lamda;

 [length,width] = size(Input);
dx=1;
dy=1;


%预处理
xx = -length/2:dx:length/2-dx;
yy = -width/2:dx:width/2-dy;
[x,y] = meshgrid(xx,yy);
% h = exp(1i*k*(x.^2+y.^2)./(2*z));

Output = fft2(Input.^(lamda*z)).^(1/(lamda*z)); 
C = (exp(1i*k*z)/(1i*lamda*z))*exp(1i*k*(x.^2+y.^2)/z);
Out = C.*Output;
Out = fftshift(Out);

% figure
imshow(abs(Out),[]);





