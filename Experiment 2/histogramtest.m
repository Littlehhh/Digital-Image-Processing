clc
close all;
Input = imread('moon.tif');
figure
imshow(Input)
figure
imhist(Input)
figure
eq=histeq(Input,256)
figure
imhist(eq)