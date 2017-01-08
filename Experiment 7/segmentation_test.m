close all
Input = imread('ʵ����2016pic\Fig1017(a).tif');
% Input = double(Input);
subplot(221)
imshow(Input,[]);
title('ԭʼͼ��')


% ֱ��ʹ��Otus���������������ĸϸ��
level = graythresh(Input);  
% �ȼ��� x = imhist(Input);level = otsuthresh(x);  
BW = im2bw(Input,level);  
subplot(222)
imshow(BW,[]);  
title('��ĸϸ��')


% ����������˹Ϊ�����ı�Ե��Ϣ�Ľ�  �̲�p485
% fspecial('laplacian')
 m = [-1 -1 -1;-1 8 -1;-1 -1 -1];
% ����������˹ͼ��ľ���ֵ
 Laplance = abs(imfilter(Input,m,'replicate'));
% ��һ�� 
 Laplance = Laplance / max(Laplance(:));
%��ñ�Ե��ȡ�ֲ�
hist = imhist(Laplance);  
%��һ���ֲ�
hist = hist/sum(hist);
%�����ۻ��ֲ�
C = cumsum(hist);
%�ҵ�Tֵ
T = find(C >= 0.995, 1, 'first');
I = (T - 1)/(numel(hist) - 1);
edge = Laplance > I;

%��ͼ��֮�����ɲο�ͼ
ref = edge .* double(Input);
refHist = imhist(ref);
%ȡ�������ص�ֱ��ͼ
refHist(1) = 0;
level = graythresh(refHist);
BW = im2bw(Input,level);  
subplot(223)
imshow(BW,[]);
title('��ĸϸ���е���������')


%������ֵ
level = 0.46;
BW = im2bw(Input,level);  
subplot(224)
imshow(BW,[]);  
title('������ֵ��ȡ��ĸϸ���е���������')