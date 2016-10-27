%%���ڲ����ռ��˲�ģ��
clc
clear
close all
%Input = [];
type = [];
Input = InputPicture();
Input = rgb2gray(Input);
Input = double(Input);
m = 3;
n = 3;
[length,width] = size(Input);
Output = zeros(length,width);

% parpool('local',4); 


%% 
%%��ֵ�˲�
mask = ones(m,n)/(m*n);
%mask = 1/16 * [1 2 1;2 4 2;1 2 1];
out = imfilter(Input,mask,'conv','replicate');
figure
out = uint8(out);
imshow(out)

tic

  
        %parallel program  
for i = 2:length-1;
    for j = 2:width-1;
        %OutputTemp = conv2(Input(i,j),mask);%����
        Output(i,j) = sum(sum(Input((i-1:i+1),(j-1:j+1)).* mask));
    end
end
toc
Output = uint8(Output);
figure
imshow(Output)

%% 
%%��ֵ�˲�
%

mask = zeros(m,n);
out = medfilt2(Input,[3 3]);
figure
out = uint8(out);
imshow(out)
for i = 2:length-1;
    for j = 2:width-1;
        mask = Input((i-1:i+1),(j-1:j+1));
        maskTemp(1,:) = mask(:);%median����ֵ��ԭ����Ҫ��maskתΪһ��
        Output(i,j) = median(maskTemp);%����ֵ
    end
end
figure
Output = uint8(Output);
imshow(Output)
delete(gcp('nocreate'));