function R = sumCERF(Input,Output)
%计算交叉熵函数
%交叉熵可度量两幅图像间的差异,交叉熵越小,图像间的差异就越小。
%Input为输入图像  Output为输出图像
[m,n] = size(Input);
sumPix = m*n;
[m,n] = size(Output);
sumPix2 = m*n;
for i=1:256;
    P(i) = sum(histc(Input,i-1))/sumPix;  %Pi表示是输入图像灰度值为i的像素数与总像素数之比
    F(i) = sum(histc(Output,i-1))/sumPix2;%Fi表示是输出图像灰度值为i的像素数与总像素数之比
end
CERF= P.*log(P./F);
CERF(isnan(CERF))=0;%剔除无效值（nan）
R=sum(CERF);
  