function Output = local_hist_equalization(Input)
 parpool('local',4);
%�ֲ�ֱ��ͼ����
% clc
% close all
% clear all
 Input = InputPicture();
 figure
 imhist(Input);

[length,width] = size(Input);
Output = zeros(length,width);


%����3*3ģ��
B = zeros(3,3);
tic
parfor i = 2:length-1;
    for j = 2:width-1;
       
       %B = myHisteq(Input(i-1:i+1,j-1:j+1));   %��3*3������ֱ��ͼ����õ�ת������������ԭͼ���ĵ�
       B = histeq(Input(i-1:i+1,j-1:j+1));
       Output(i,j) =  B(2,2);
        
    end
end
toc
Output = uint8(Output);
figure
imhist(Output);
figure
imshow(Output);

delete(gcp('nocreate'));