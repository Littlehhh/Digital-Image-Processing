clc
clear all
close all
Input = InputPicture();
if size(Input,3)==3
    Input = rgb2gray(Input);
end
%Input = double(Input);
SizeOfMask = 3;  %ģ���С

% [length,width] = size(Input);
% Output = zeros(length,width);
% Output = myFilter(Input,SizeOfMask,'average');
% figure
% imshow(Output)
% title('��ֵ�˲�');
% Output = myFilter(Input,SizeOfMask,'gaussian');
% figure
% imshow(Output)
% title('��˹�˲�');
% Output = myFilter(Input,SizeOfMask,'median');
% figure
% imshow(Output)  
% title('��ֵ�˲�');
% Output = myFilter(Input,SizeOfMask,'laplacian');
% figure
% imshow(Output)  
Output = myFilter(Input,SizeOfMask,'sobel');

figure
imshow(Output)  