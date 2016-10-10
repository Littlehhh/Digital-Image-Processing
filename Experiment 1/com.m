%利用交叉熵公式
%用于插值方法的比较
clc
clear all
%close all
H = 3;
W = 3;
Input = InputPicture();
Output = resizeNEAREST(H,W,Input);
Output1 = resizeLINEAR(H,W,Input);
Output2 = resizeLINEAR2(H,W,Input);
Output3 = resizeBicubic(H,W,Input);
out = imresize(Input,H,'nearest');
out2 = imresize(Input,H,'bilinear');
out3 = imresize(Input,H,'bicubic');
%计算交叉熵
R = sumCERF(Input,Output2)
R1 = sumCERF(Input,Output3)
R2 = sumCERF(Input,out2)
R3 = sumCERF(Input,out3)
figure
imhist(Output3)
figure
imhist(out3)


