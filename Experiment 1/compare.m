

clc
clear all
close all
H = 3;
W = 3;
Input = InputPicture();
Output = resizeNEAREST(H,W,Input);
Output1 = resizeLINEAR(H,W,Input);
Output2 = resizeLINEAR2(H,W,Input);
out = imresize(Input,H,'nearest');
out2 = imresize(Input,H,'bilinear');

figure
imhist(Output1)
figure
imhist(Output2)
figure
imhist(out2)

Compare = out-Output;
figure
surf(Compare)
Compare1 = out2-Output1;
figure
surf(Compare1)
Compare2 = out2-Output2;
figure
surf(Compare2)
sum(sum(Compare1))
sum(sum(Compare2))


