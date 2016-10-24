clc
close all;
%Input = InputPicture();
Input = imread('moon.tif');
figure
imshow(Input)
figure
imhist(Input)
%Ù¤Âí±ä»»   
ad = imadjust(Input,[0 1],[0 1],0.5);
eq = myHisteq(Input);
figure
imshow(ad)
figure
imhist(ad)
figure
imshow(eq)
figure
imhist(eq)

