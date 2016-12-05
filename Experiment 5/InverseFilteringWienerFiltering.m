%% --------------------input image--------------------------------
% 对一副图像进行运动模糊并加高斯噪声，对图像进行逆滤波和维纳滤波进行复原
close all
clc
f = InputPicture();

lenth = size(f,1);
width = size(f,2);
f1 = imnoise(f,'gaussian',0,0.01);% 添加高斯噪声
f2 = double(f1);
% -------------------------------------------------------------------------
subplot(221)
imshow(f);
title('original image');
%% % 对图形进行运动模糊
F = fft2(f2);
H = zeros(lenth,width);
a=0.02;b=0.02;T=1;
for u=1:lenth
    for v=1:width
        H(u,v) = T*sin(pi*(u*a+v*b))*exp(-1i*pi*(u*a+v*b))/(pi*(u*a+v*b));
    end
end
G = H.*F;% 添加运动模糊
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
%调用matlab提供的维纳滤波函数
h=real(ifft2(ifftshift(H)));
result1=deconvwnr(g,h,0.0025);
result2=ifftshift(result1);
subplot(224);
imshow(result2,[]);
title('wiener filtering');
