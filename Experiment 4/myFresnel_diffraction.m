function Out = myFresnel_diffraction(Input,lamda,z)
%����������
lamda = lamda/1000000;
k = 2*pi/lamda;
[length,width] = size(Input);

dx=1;
dy=1;
% %��������
% z = 800; %mm

%Ԥ����
xx = -length/2:dx:length/2-dx;
yy = -width/2:dx:width/2-dy;

[x,y] = meshgrid(xx,yy);
h = exp(1i*k*(x.^2+y.^2)./(2*z));
% tic
Output = ifft2(fft2(Input).*fft2(h));  %���þ����������������ת��Ϊ����Ҷ�任�ĳ˻�

% toc
% tic
%  Output2 = conv2(Input,h,'same'); 
% toc
Out = exp(1i*k*z).*Output/(1i*lamda*z);

% figure
imshow(abs(Out),[]);






