function Out = myFresnel_diffraction(Input,lamda,z)%,sizexSLM,sizeySLM)
%菲涅尔衍射
lamda = lamda/1000000;
k = 2*pi/lamda;
[length,width] = size(Input);

dx=1;
dy=1;
% %传播距离
% z = 800; %mm

%预处理
xx = -length/2:dx:length/2-dx;
yy = -width/2:dx:width/2-dy;

[x,y] = meshgrid(xx,yy);
h = exp(1i*k*(x.^2+y.^2)./(2*z));

Output = fftshift(ifft2(fft2(Input).*fft2(h)));  %利用卷积定理将菲涅尔衍射转化为傅里叶变换的乘积
% Output = conv2(Input,h,'same'); 

Out = exp(1i*k*z).*Output/(1i*lamda*z);

% figure
imshow(abs(Out),[]);






