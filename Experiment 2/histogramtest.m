clc
close all;
%Input = InputPicture();
Input = imread('moon.tif');
figure
imshow(Input)
figure
imhist(Input)
%٤��任   
ad = imadjust(Input,[0 1],[0 1],0.5);

figure
imshow(ad)
figure
imhist(ad)


