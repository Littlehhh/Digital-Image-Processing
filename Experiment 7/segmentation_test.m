close all
Input = imread('实验七2016pic\Fig1017(a).tif');
% Input = double(Input);
subplot(221)
imshow(Input,[]);
title('原始图像')


% 直接使用Otus方法分离出整个酵母细胞
level = graythresh(Input);  
% 等价于 x = imhist(Input);level = otsuthresh(x);  
BW = im2bw(Input,level);  
subplot(222)
imshow(BW,[]);  
title('酵母细胞')


% 利用拉普拉斯为基础的边缘信息改进  教材p485
% fspecial('laplacian')
 m = [-1 -1 -1;-1 8 -1;-1 -1 -1];
% 计算拉普拉斯图像的绝对值
 Laplance = abs(imfilter(Input,m,'replicate'));
% 归一化 
 Laplance = Laplance / max(Laplance(:));
%获得边缘提取分布
hist = imhist(Laplance);  
%归一化分布
hist = hist/sum(hist);
%计算累积分布
C = cumsum(hist);
%找到T值
T = find(C >= 0.995, 1, 'first');
I = (T - 1)/(numel(hist) - 1);
edge = Laplance > I;

%两图象之积生成参考图
ref = edge .* double(Input);
refHist = imhist(ref);
%取非零像素的直方图
refHist(1) = 0;
level = graythresh(refHist);
BW = im2bw(Input,level);  
subplot(223)
imshow(BW,[]);
title('酵母细胞中的亮点区域')


%自设阈值
level = 0.46;
BW = im2bw(Input,level);  
subplot(224)
imshow(BW,[]);  
title('自设阈值提取酵母细胞中的亮点区域')