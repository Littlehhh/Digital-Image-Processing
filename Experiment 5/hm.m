close all
%Input1=double(InputPicture());
Input1 = imread('Fig0322(a).tif');
Input = fftshift(fft2(Input1));
Input = abs(Input);
Input = log(Input);
imshow(Input,[])
title('原始频谱')
[length,width] = size(Input);
Mask = ones(length,width);

    % 我认为滤波效果最好的滤去区域   但是右下角有部分失真 btw滤波器的失真较小 高斯滤波器稍差
    Mask(1:322,335:339) = 0;
    Mask(347:674,335:339) = 0;
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('理想滤波器')
    
    Mask(1:322,335:339) = 1-LPF(322,5,'btw',322,3);
    Mask(347:674,335:339) = 1-LPF(328,5,'btw',327,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('巴特沃斯滤波器')
    
    Mask(1:322,335:339) = 1-LPF(322,5,'gaussian',322,3);
    Mask(347:674,335:339) = 1-LPF(328,5,'gaussian',327,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('高斯滤波器')
    
    %噪声
    Mask = zeros(length,width);
    Mask(1:322,335:339) = 1;
    Mask(347:674,335:339) = 1;
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('理想滤波器滤得的噪声')
    
    Mask(1:322,335:339) = LPF(322,5,'btw',164,3);
    Mask(347:674,335:339) = LPF(328,5,'btw',164,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('巴特沃斯滤波器滤得的噪声')
    
    Mask(1:322,335:339) = LPF(322,5,'gaussian',164,3);
    Mask(347:674,335:339) = LPF(328,5,'gaussian',164,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('高斯滤波器滤得的噪声')

