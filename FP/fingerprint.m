
function [TF] = fingerprint(filename)
% [Input]=InputPicture();
% figure
% imhist(Input);
% level = graythresh(Input);  
% % �ȼ��� x = imhist(Input);level = otsuthresh(x);  
% BW = im2bw(Input,level);  
% figure
% imshow(BW,[]); 
if ischar(filename)
    Input = imread(filename);
else
    Input = filename;
end
%���㹲������
glcms = graycomatrix(Input,'GrayLimits',[],'offset',[0 1;-1 1;-1 0;-1 -1]);%Ϊ�˱�֤������������ת�����Դ˴���������0,45,90,135���ĸ�����Ĺ�������
stats = graycoprops(glcms);
TF.Energy = sum(stats.Energy);       %�Ƕ��׾أ�������
TF.Contrast = sum(stats.Contrast);     %�Աȶ�
TF.Homogeneity = sum(stats.Homogeneity);%����/�������/������/ͬ����
TF.Correlation = sum(stats.Correlation);%��ض�

