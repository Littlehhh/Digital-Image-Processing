close all
%Input1=double(InputPicture());
Input1 = imread('Fig0322(a).tif');
Input = fftshift(fft2(Input1));
Input = abs(Input);
Input = log(Input);
imshow(Input,[])
title('ԭʼƵ��')
[length,width] = size(Input);
Mask = ones(length,width);

    % ����Ϊ�˲�Ч����õ���ȥ����   �������½��в���ʧ�� btw�˲�����ʧ���С ��˹�˲����Բ�
    Mask(1:322,335:339) = 0;
    Mask(347:674,335:339) = 0;
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('�����˲���')
    
    Mask(1:322,335:339) = 1-LPF(322,5,'btw',322,3);
    Mask(347:674,335:339) = 1-LPF(328,5,'btw',327,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('������˹�˲���')
    
    Mask(1:322,335:339) = 1-LPF(322,5,'gaussian',322,3);
    Mask(347:674,335:339) = 1-LPF(328,5,'gaussian',327,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('��˹�˲���')
    
    %����
    Mask = zeros(length,width);
    Mask(1:322,335:339) = 1;
    Mask(347:674,335:339) = 1;
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('�����˲����˵õ�����')
    
    Mask(1:322,335:339) = LPF(322,5,'btw',164,3);
    Mask(347:674,335:339) = LPF(328,5,'btw',164,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('������˹�˲����˵õ�����')
    
    Mask(1:322,335:339) = LPF(322,5,'gaussian',164,3);
    Mask(347:674,335:339) = LPF(328,5,'gaussian',164,3);
    Out = Mask.* fftshift(fft2(Input1));
    Out1 = ifft2(Out);
    Out = abs(Out1);
    figure
    imshow(Out,[])
    title('��˹�˲����˵õ�����')

