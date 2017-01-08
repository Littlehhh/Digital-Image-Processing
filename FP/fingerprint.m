
function [TF] = fingerprint(filename)
% [Input]=InputPicture();
% figure
% imhist(Input);
% level = graythresh(Input);  
% % 等价于 x = imhist(Input);level = otsuthresh(x);  
% BW = im2bw(Input,level);  
% figure
% imshow(BW,[]); 
if ischar(filename)
    Input = imread(filename);
else
    Input = filename;
end
%计算共生矩阵
glcms = graycomatrix(Input,'GrayLimits',[],'offset',[0 1;-1 1;-1 0;-1 -1]);%为了保证纹理特征的旋转不变性此处共计算了0,45,90,135度四个方向的共生矩阵
stats = graycoprops(glcms);
TF.Energy = sum(stats.Energy);       %角二阶矩（能量）
TF.Contrast = sum(stats.Contrast);     %对比度
TF.Homogeneity = sum(stats.Homogeneity);%逆差矩/反差矩阵/均匀性/同质性
TF.Correlation = sum(stats.Correlation);%相关度

