clc
clear all
%close all
H = 3;
W = 3;
Input = InputPicture();
%Output = resizeNEAREST(H,W,Input);
Output1 = resizeLINEAR(H,W,Input);
Output2 = resizeLINEAR2(H,W,Input);
out = imresize(Input,H,'nearest');
out2 = imresize(Input,H,'bilinear');

R = sumCERF(Input,Output1);
R1 = sumCERF(Input,Output2);
R2 = sumCERF(Input,out2);
