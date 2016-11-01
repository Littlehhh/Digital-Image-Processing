clc
clear all
close all
Input = InputPicture();
%Input = rgb2gray(Input);
% Input = double(Input);
SizeOfMask = 3;  %Ä£°å´óÐ¡

% [length,width] = size(Input);
% Output = zeros(length,width);
Output = myFilter(Input,SizeOfMask,'average');
figure
imshow(Output)
Output = myFilter(Input,SizeOfMask,'gaussian');
figure
imshow(Output)
Output = myFilter(Input,SizeOfMask,'median');
figure
imshow(Output)  
% Output = myFilter(Input,SizeOfMask,'laplacian');
% figure
% imshow(Output)  
% Output = myFilter(Input,SizeOfMask,'sobel');
% figure
% imshow(Output)  