%人机交互滤波
%采用巴特沃斯滤波器  n=2;可以修改
%每次选取你想滤去频谱矩形区域的左上角和右下角
close all
Input1=double(InputPicture());
times = 8;%滤波次数   需要滤几次可以修改
n = 2;
Input = fftshift(fft2(Input1));
Input = abs(Input);

Input = log(Input);
%mesh(Input)
imshow(Input,[])
title(['选取你想滤去矩形区域的左上角和右下角，还剩滤波次数',num2str(times),'次']);

[length,width] = size(Input);

Mask = ones(length,width);

for i=1:times;    
    %选取对角线端点
    [x,y] = ginput(2);
    mask = 1-LPF(floor(y(2))-floor(y(1)),floor(x(2))-floor(x(1)),'btw',floor(max(x(2)-x(1),y(2)-y(1)))/2,n);
    Mask(floor(y(1)):floor(y(2))-1,floor(x(1)):floor(x(2))-1) = mask;   
    Input = Mask.* Input;
    imshow(Input,[])
    title(['选取你想滤去矩形区域的左上角和右下角，还剩滤波次数',num2str(times-i),'次']);
end
%Mask = 1-Mask;  %加上此句即为噪声结果
Out = Mask.* fftshift(fft2(Input1));
Out1 = ifft2(Out);
Out = abs(Out1);
figure
imshow(Out,[])
