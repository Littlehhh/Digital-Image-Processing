f = tofloat(imread('Fig1017(a).tif'));  
imhist(f) % Fig. 10.17(b).  
hf = imhist(f);  
level = graythresh(f);  
 gf = im2bw(f, Tf);  
 figure, imshow(gf) % Fig. 10.17(c)
 
w = [-1 -1 -1; -1 8 -1; -1 -1 -1];  
lap = abs(imfilter(f, w, 'replicate'));  
 lap = lap/max(lap(:));  
 h = imhist(lap);  
%归一化分布
h = h/sum(h);
%计算累积分布
C = cumsum(h);
%找到T值
T = find(C >= 0.995, 1, 'first');
I = (T - 1)/(numel(h) - 1);


%找到边缘附近符合阈值的点

 edge = lap > I;  
 fp = f .* edge;  

 hp = imhist(fp);  
 hp(1) = 0;  
figure, bar(hp, 0) % Fig. 10.17(e).  
 T = otsuthresh(hp);  
 g = im2bw(f, T);  
 figure, imshow(g) % Fig. 10.17(f).