function Out = myFresnel_diffraction(Input,lamda,z,sizexSLM,sizeySLM)
% clc
% % close  all
% clear
% 
%  Input = InputPicture();
% 
% if size(Input,3)==3
%     Input = rgb2gray(Input);
% end
% Input = double(Input)/255;
% lamda = 532/1000000;
%  k = 2*pi/lamda;
% sizexSLM = 12;
% sizeySLM = 12;
% %������
 [length,width] = size(Input);
 dx = sizexSLM/length;
 dy = sizeySLM/width;
% %��������
% z = 800; %mm

%Ԥ����
xx = -sizexSLM/2:dx:sizexSLM/2-dx;
yy = -sizeySLM/2:dx:sizeySLM/2-dy;
[x,y] = meshgrid(xx,yy);
h = exp(1i*k*(x.^2+y.^2)./(2*z));

Output = fftshift(ifft2(fft2(Input).*fft2(h)));  %���þ����������������ת��Ϊ����Ҷ�任�ĳ˻�
% Output = conv2(Input,h,'same'); 

Out = exp(1i*k*z).*Output/(1i*lamda*z);
%  Out = fftshift(Out);
% Out_abs = mat2gray(abs(Out));
% Out_angle = mat2gray(angle(Out));
%Out = uint8(Out);
figure
imshow(abs(Out),[]);
% imshow(Out_abs,[]);
% figure
% imshow(Out_angle);
% OutputPicture(Out_abs);





