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
%��һ���ֲ�
h = h/sum(h);
%�����ۻ��ֲ�
C = cumsum(h);
%�ҵ�Tֵ
T = find(C >= 0.995, 1, 'first');
I = (T - 1)/(numel(h) - 1);


%�ҵ���Ե����������ֵ�ĵ�

 edge = lap > I;  
 fp = f .* edge;  

 hp = imhist(fp);  
 hp(1) = 0;  
figure, bar(hp, 0) % Fig. 10.17(e).  
 T = otsuthresh(hp);  
 g = im2bw(f, T);  
 figure, imshow(g) % Fig. 10.17(f).