function Output = myFilter(Input,SizeOfMask,type)
%集成空间滤波函数
%%关于此函数的说明
%调用格式


% 均值滤波  Output = myFilter(Input,SizeOfMask,'average'); SizeOfMask 为任意合理奇数

% 高斯滤波  Output = myFilter(Input,SizeOfMask,'gaussian');SizeOfMask 为任意合理奇数

% 拉普拉斯滤波 Output = myFilter(Input,SizeOfMask,'laplacian'); SizeOfMask = 1时
%               mask = [0 1 0;1 -4 1;0 1 0];其余 mask = [0 1 0;1 -8 1;0 1 0];

% sobel滤波  Output = myFilter(Input,SizeOfMask,'sobel');SizeOfMask已经内置，任意数即可

% 中值滤波  Output = myFilter(Input,SizeOfMask,'median');SizeOfMask 为任意合理奇数


Input = double(Input);
% SizeOfMask = 3;  %模板大小
% Output = zeros(length,width);
Output = Input;
% parpool('local',4); 
switch type
  case 'average' % Smoothing filter
     mask   = ones(SizeOfMask)/(SizeOfMask*SizeOfMask);
     Output = conv2(Input,mask,'same');
  case 'gaussian' % Gaussian filter
     siz   = [SizeOfMask SizeOfMask];
     sigma   = 3;
     %生成高斯模板
     [x,y] = meshgrid(-siz(2):siz(2),-siz(1):siz(1));
     arg   = -(x.*x + y.*y)/(2*sigma*sigma);

     mask  = exp(arg);
     mask  = mask/sum(sum(mask));  %归一化高斯模板
     Output = conv2(Input,mask,'same');
   case 'laplacian' % Laplacian filter
     if SizeOfMask == 1;
       mask = [0 1 0;1 -4 1;0 1 0];
     else
       mask = [0 1 0;1 -8 1;0 1 0];
     end
     Output = conv2(Input,mask,'same');
   case 'sobel' % Sobel filter
     mask = [1 2 1;0 0 0;-1 -2 -1];
     Gx = conv2(Input,mask','same');
     Gy = conv2(Input,mask,'same');
     Output = abs(Gx)+abs(Gy);
     
   case 'median' %median filter
     Output = myMedfilt(Input,SizeOfMask);  
end
Output = uint8(Output);
%% 
%%均值滤波
% mask = ones(m,n)/(m*n);
% %mask = 1/16 * [1 2 1;2 4 2;1 2 1];
% out = imfilter(Input,mask,'conv','replicate');
% figure
% out = uint8(out);
% imshow(out)
% 
% tic
% fspecial
%   
% Output = conv2(Input,mask,'same');
        
% for i = 2:length-1;
%     for j = 2:width-1;
%         %OutputTemp = conv2(Input(i,j),mask);%求卷积
%         Output(i,j) = sum(sum(Input((i-1:i+1),(j-1:j+1)).* mask));
%     end
% end
% toc
% Output = uint8(Output);
% figure
% imshow(Output)
end
%% 
%%中值滤波
%
function Output = myMedfilt(Input,SizeOfMask)
    n = (SizeOfMask-1)/2;
    Output = Input;
%     out = medfilt2(Input,[3 3]);
%     figure
%     out = uint8(out);
%     imshow(out)
    [length,width] = size(Input);
%     Output = zeros(length,width);
    for i = 1+n:length-n;
        for j = 1+n:width-n;
            mask = Input((i-n:i+n),(j-n:j+n));
            maskTemp(1,:) = mask(:);%median返回值的原因需要将mask转为一行
            Output(i,j) = median(maskTemp);%求中值
        end
    end
end
% figure
% Output = uint8(Output);
% imshow(Output)
%delete(gcp('nocreate'));