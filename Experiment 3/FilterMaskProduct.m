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

%% 
%%��ֵ�˲�
mask = ones(m,n)/(m*n);
%mask = 1/16 * [1 2 1;2 4 2;1 2 1];

for i = 2:length-1;
    for j = 2:width-1;
        %OutputTemp = conv2(Input(i,j),mask);%����
        Output(i,j) = sum(sum(Input((i-1:i+1),(j-1:j+1)).* mask));
    end
end
Output = uint8(Output);
imshow(Output)

%% 
%%��ֵ�˲�
%medfilt2

mask = zeros(m,n);
for i = 2:length-1;
    for j = 2:width-1;
        mask = Input((i-1:i+1),(j-1:j+1));
        maskTemp(1,:) = mask(:);
        Output(i,j) = median(maskTemp);%����ֵ
    end
end
figure
Output = uint8(Output);
imshow(Output)
