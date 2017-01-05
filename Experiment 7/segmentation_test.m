close all
% 
Input = imread('Fig1017(a).tif');
% Input = double(Input);
imshow(Input,[]);
title('原始图像')
% figure
x= imhist(Input);
% Input = histeq(Input);


%直接使用Otus方法分离出整个酵母细胞
% level = graythresh(Input);  
% level = otsuthresh(x);  
% BW = im2bw(Input,level);  
% figure
% imshow(BW,[]);  

%-fspecial('laplacian')
m = [-1 -1 -1;-1 8 -1;-1 -1 -1];

Laplance = abs(imfilter(Input,m,'replicate'));
% 
% Laplance = Laplance / max(Laplance(:));
% h = imhist(Laplance);
% Q = percentile2i(h,0.995);
% marker = Laplance > Q;
% out = double(Input) .* marker;
% p = imhist(out);
% p(1) = 0;
% level = otsuthresh(p);
% BW = im2bw(Input,level); 
% figure
% imshow(BW,[]);  

Laplance = Laplance / max(Laplance(:));
% figure
% imshow(Laplance,[])
% figure
% imhist(Laplance)
ref = Laplance .* Input;
figure
imshow(ref,[])
bar(ref);
% level = graythresh(ref);
BW = im2bw(ref,level);  
imshow(BW,[]);
% level = 0.35;
% BW = im2bw(Input,level);  
% figure
% imshow(BW,[]);  