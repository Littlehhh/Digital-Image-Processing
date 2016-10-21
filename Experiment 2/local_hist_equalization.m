function Output = local_hist_equalization(Input)

%�ֲ�ֱ��ͼ����
% clc
% close all
% clear all
%Input = InputPicture();
% figure
% imhist(Input);

[length,width] = size(Input);
Output = zeros(length,width);


%����3*3ģ��
B = zeros(3,3);

for i = 2:length-1;
    for j = 2:width-1;
       
       B = myHisteq(Input(i-1:i+1,j-1:j+1));   %��3*3������ֱ��ͼ����õ�ת������������ԭͼ���ĵ�
       Output(i,j) =  B(2,2);
        
    end
end
Output = uint8(Output);

