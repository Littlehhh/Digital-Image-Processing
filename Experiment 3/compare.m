clc
clear
close all
%利用交叉熵公式
%用于去噪方法的比较
Input1 = InputPicture();%噪声图像
Input = InputPicture();%无噪声原图像
if size(Input,3)==3
    Input = rgb2gray(Input);
    Input1 = rgb2gray(Input1);
end
%Input = double(Input);
SizeOfMask = 3;
Output = myFilter(Input1,SizeOfMask,'average');
Output2 = myFilter(Input1,SizeOfMask,'gaussian');
Output3 = myFilter(Input1,SizeOfMask,'median');
%计算交叉熵
R = sumCERF(Input,Output)
R1 = sumCERF(Input,Output2)
R2 = sumCERF(Input,Output3)
[M,N] = size(Input);
ave = sum(sum((double(Input)-double(Output)).^2))/(M*N)
ave2 = sum(sum((double(Input)-double(Output2)).^2))/(M*N)
ave3 = sum(sum((double(Input)-double(Output3)).^2))/(M*N)
ave = sum(sum((Input-Output).^2))/(M*N)
ave2 = sum(sum((Input-Output2).^2))/(M*N)
ave3 = sum(sum((Input-Output3).^2))/(M*N)