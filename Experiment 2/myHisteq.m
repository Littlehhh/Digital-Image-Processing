clc
close all
clear all
Input = InputPicture();
%Input = double(Input);
figure
imhist(Input)

[lenth,width] = size(Input);

%直方图均衡
%计算各灰度级概率

CDF = caculateCDF(Input);
% PDF = zeros(1,256);
% num = zeros(1,256);
% for i=1:256;
%     num(i) = sum(histc(Input,i-1));
% end
% PDF = num./numel(Input);
% %累计分布函数
% CDF = zeros(1,256);
% CDF(1)=PDF(1);
% for i=2:256;
%     CDF(i)= PDF(i)+CDF(i-1);
% end
% %stem(CDF)

%均衡
Eq = round(CDF*255);%/numel(Input);
%RPDF = Eq.*num;
Output = zeros(lenth,width);
for i=1:lenth
    for j=1:width
        Output(i,j) = Eq(Input(i,j)+1);
    end
end
Output = uint8(Output);
figure
imhist(Output)
figure
imshow(Output)











