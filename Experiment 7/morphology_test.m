clc
% [Input]=InputPicture();
Input = imread('Fig0925(a).tif');
Input = double(Input);
subplot(221)
imshow(Input,[]);
title('ԭʼͼ��')


%Ԥ����ƽ��ͼ��
Input = imopen(Input,strel('disk',2,8));
Input = imclose(Input,strel('disk',2,8));
subplot(222)
imshow(Input,[])
title('Ԥ����ƽ��ͼ��')


%��ȡ�ϴ�ľ��
R = 20;
SE = strel('disk',R,8);
BW = imopen(Input,SE);
subplot(223)
imshow(BW,[]);
title('��ȡ�ϴ�ľ��')
%SE = strel('rectangle',[R R]);

%��ȡ��Сľ��
BW = Input - BW;
SE = strel('disk',12,8);
BW = imopen(BW,SE);
subplot(224)
imshow(BW,[]);
title('��ȡ��Сľ��')