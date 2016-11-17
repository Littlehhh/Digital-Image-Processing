function Out = myFraunhofer(Input,lamda,z)%,sizexSLM,sizeySLM)
% clc
% close  all
% clear
% 
%  Input = InputPicture();
% 
% if size(Input,3)==3
%     Input = rgb2gray(Input);
% end
% Input = double(Input)/255;
 lamda = lamda/1000000;
 k = 2*pi/lamda;
% sizexSLM = 12;
% sizeySLM = 12;
%采样率
 [length,width] = size(Input);
dx=1;
dy=1;
% %传播距离
% z = 800; %mm

%预处理
xx = -length/2:dx:length/2-dx;
yy = -width/2:dx:width/2-dy;
[x,y] = meshgrid(xx,yy);
% h = exp(1i*k*(x.^2+y.^2)./(2*z));

Output = fft2(Input.^(lamda*z)).^(1/(lamda*z)); 
% Output = conv2(Input,h,'same'); 
C = (exp(1i*k*z)/(1i*lamda*z))*exp(1i*k*(x.^2+y.^2)/z);
Out = C.*Output;
Out = fftshift(Out);
% Out_abs = mat2gray(abs(Out));
% Out_angle = mat2gray(angle(Out));
%Out = uint8(Out);
% figure
imshow(abs(Out),[]);
% imshow(Out_abs,[]);
% figure
% imshow(Out_angle);
% OutputPicture(Out_abs);





