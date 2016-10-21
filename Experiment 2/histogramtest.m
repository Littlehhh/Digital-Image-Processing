clc
close all;
Input = InputPicture();
%Input = imread('moon.tif');
figure
imshow(Input)
figure
imhist(Input)


eq = histeq(Input);
figure
%imhist(eq)
imshow(eq)
figure
imhist(eq)

ad = imadjust(Input,[0 1],[0 1],0.5);
figure
%imhist(eq)
imshow(ad)
figure
imhist(ad)


