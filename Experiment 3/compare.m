clc
clear
close all
%���ý����ع�ʽ
%����ȥ�뷽���ıȽ�
Input1 = InputPicture();%����ͼ��
Input = InputPicture();%������ԭͼ��
if size(Input,3)==3
    Input = rgb2gray(Input);
    Input1 = rgb2gray(Input1);
end
%Input = double(Input);
SizeOfMask = 3;
Output = myFilter(Input1,SizeOfMask,'average');
Output2 = myFilter(Input1,SizeOfMask,'gaussian');
Output3 = myFilter(Input1,SizeOfMask,'median');
%���㽻����
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