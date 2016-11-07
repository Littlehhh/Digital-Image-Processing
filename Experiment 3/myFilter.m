function Output = myFilter(Input,SizeOfMask,type)
%   ���ɿռ��˲�����
%   ���й��ܣ���ֵ�˲� ��˹�˲� ������˹�˲� sobel�˲� ��ֵ�˲�
%   �������Լ�����չ

%%  ���ڴ˺�����˵��
%   ���ø�ʽ

% ��ֵ�˲�  Output = myFilter(Input,SizeOfMask,'average'); SizeOfMask Ϊ�����������

% ��˹�˲�  Output = myFilter(Input,SizeOfMask,'gaussian');SizeOfMask Ϊ�����������

% ������˹�˲� Output = myFilter(Input,SizeOfMask,'laplacian'); SizeOfMask = 1ʱ
%               mask = [0 1 0;1 -4 1;0 1 0];���� mask = [0 1 0;1 -8 1;0 1 0];

% sobel�˲�  Output = myFilter(Input,SizeOfMask,'sobel');SizeOfMask �Ѿ����ã�����������

% ��ֵ�˲�  Output = myFilter(Input,SizeOfMask,'median');SizeOfMask Ϊ�����������

%Attention
%�ú���ֻ�ܴ����ά���ݣ�rgb��Ҫ�Ƚ�ͼƬתΪgray���߽����ǵ����������������

Input = double(Input);
% SizeOfMask = 3;  %ģ���С
% Output = zeros(length,width);
Output = Input;

switch type
  case 'average' % Smoothing filter
     mask   = ones(SizeOfMask)/(SizeOfMask*SizeOfMask);
     Output = conv2(Input,mask,'same');
  case 'gaussian' % Gaussian filter
     siz   = [SizeOfMask SizeOfMask];
     sigma   = 3;
     %���ɸ�˹ģ��
     [x,y] = meshgrid(-siz(2):siz(2),-siz(1):siz(1));
     arg   = -(x.*x + y.*y)/(2*sigma*sigma);

     mask  = exp(arg);
     mask  = mask/sum(sum(mask));  %��һ����˹ģ��
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
end
%% 
%%��ֵ�˲�
%
function Output = myMedfilt(Input,SizeOfMask)
    n = (SizeOfMask-1)/2;
    Output = Input;
    [length,width] = size(Input);
    for i = 1+n:length-n;
        for j = 1+n:width-n;
            mask = Input((i-n:i+n),(j-n:j+n));
            maskTemp(1,:) = mask(:);%median����ֵ��ԭ����Ҫ��maskתΪһ��
            Output(i,j) = median(maskTemp);%����ֵ
        end
    end
end
