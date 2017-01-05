clc
% [Input]=InputPicture();
Input = imread('Fig0925(a).tif');
Input = double(Input);
subplot(221)
imshow(Input,[]);
title('原始图像')


%预处理平滑图像
Input = imopen(Input,strel('disk',2,8));
Input = imclose(Input,strel('disk',2,8));
subplot(222)
imshow(Input,[])
title('预处理平滑图像')


%提取较大木钉
R = 20;
SE = strel('disk',R,8);
BW = imopen(Input,SE);
subplot(223)
imshow(BW,[]);
title('提取较大木钉')
%SE = strel('rectangle',[R R]);

%提取较小木钉
BW = Input - BW;
SE = strel('disk',12,8);
BW = imopen(BW,SE);
subplot(224)
imshow(BW,[]);
title('提取较小木钉')