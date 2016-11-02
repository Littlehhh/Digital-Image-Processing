clc
clear all
close all
Input = InputPicture();
if size(Input,3)==3
    Input = rgb2gray(Input);
end
%Input = double(Input);
SizeOfMask = 3;  %模板大小

% [length,width] = size(Input);
% Output = zeros(length,width);
% Output = myFilter(Input,SizeOfMask,'average');
% figure
% imshow(Output)
% title('均值滤波');
% Output = myFilter(Input,SizeOfMask,'gaussian');
% figure
% imshow(Output)
% title('高斯滤波');
% Output = myFilter(Input,SizeOfMask,'median');
% figure
% imshow(Output)  
% title('中值滤波');
% Output = myFilter(Input,SizeOfMask,'laplacian');
% figure
% imshow(Output)  
Output = myFilter(Input,SizeOfMask,'sobel');

figure
imshow(Output)  