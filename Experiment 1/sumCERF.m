function R = sumCERF(Input,Output)
%���㽻���غ���
%�����ؿɶ�������ͼ���Ĳ���,������ԽС,ͼ���Ĳ����ԽС��
%InputΪ����ͼ��  OutputΪ���ͼ��
[m,n] = size(Input);
sumPix = m*n;
[m,n] = size(Output);
sumPix2 = m*n;
for i=1:256;
    P(i) = sum(histc(Input,i-1))/sumPix;  %Pi��ʾ������ͼ��Ҷ�ֵΪi������������������֮��
    F(i) = sum(histc(Output,i-1))/sumPix2;%Fi��ʾ�����ͼ��Ҷ�ֵΪi������������������֮��
end
CERF= P.*log(P./F);
CERF(isnan(CERF))=0;%�޳���Чֵ��nan��
R=sum(CERF);
  