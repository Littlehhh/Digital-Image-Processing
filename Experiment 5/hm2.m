%�˻������˲�
%���ð�����˹�˲���  n=2;�����޸�
%ÿ��ѡȡ������ȥƵ�׾�����������ϽǺ����½�
close all
Input1=double(InputPicture());
times = 8;%�˲�����   ��Ҫ�˼��ο����޸�
n = 2;
Input = fftshift(fft2(Input1));
Input = abs(Input);

Input = log(Input);
%mesh(Input)
imshow(Input,[])
title(['ѡȡ������ȥ������������ϽǺ����½ǣ���ʣ�˲�����',num2str(times),'��']);

[length,width] = size(Input);

Mask = ones(length,width);

for i=1:times;    
    %ѡȡ�Խ��߶˵�
    [x,y] = ginput(2);
    mask = 1-LPF(floor(y(2))-floor(y(1)),floor(x(2))-floor(x(1)),'btw',floor(max(x(2)-x(1),y(2)-y(1)))/2,n);
    Mask(floor(y(1)):floor(y(2))-1,floor(x(1)):floor(x(2))-1) = mask;   
    Input = Mask.* Input;
    imshow(Input,[])
    title(['ѡȡ������ȥ������������ϽǺ����½ǣ���ʣ�˲�����',num2str(times-i),'��']);
end
%Mask = 1-Mask;  %���ϴ˾伴Ϊ�������
Out = Mask.* fftshift(fft2(Input1));
Out1 = ifft2(Out);
Out = abs(Out1);
figure
imshow(Out,[])
