%% --------------------input image--------------------------------
% ��һ��ͼ������˶�ģ�����Ӹ�˹��������ͼ��������˲���ά���˲����и�ԭ
close all
clc
f = InputPicture();

lenth = size(f,1);
width = size(f,2);
f1 = imnoise(f,'gaussian',0,0.01);% ��Ӹ�˹����
f2 = double(f1);
% -------------------------------------------------------------------------
subplot(221)
imshow(f);
title('original image');
%% % ��ͼ�ν����˶�ģ��
F = fft2(f2);
H = zeros(lenth,width);
a=0.02;b=0.02;T=1;
for u=1:lenth
    for v=1:width
        H(u,v) = T*sin(pi*(u*a+v*b))*exp(-1i*pi*(u*a+v*b))/(pi*(u*a+v*b));
    end
end
G = H.*F;% ����˶�ģ��
% -----------------------------------------------------------------------
g =ifft2(G);
g = real(g);
Output = uint8(g);
subplot(222)
imshow(Output,[]);
title('blurry image');
%% % ----------------inverse filtering----------------------------
F = G./H;
f3 = ifft(F);
f3 = real(f3);
% ------------------------------------------------------
Output = uint8(f3);
subplot(223)
imshow(Output,[]);
title('inverse filtering');
%% % --------------wiener filtering------------------------
%����matlab�ṩ��ά���˲�����
h=real(ifft2(ifftshift(H)));
result1=deconvwnr(g,h,0.0025);
result2=ifftshift(result1);
subplot(224);
imshow(result2,[]);
title('wiener filtering');
