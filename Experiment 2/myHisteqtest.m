%function Output = myHisteq(Input,fun,Y)
%fun = 1  ֱ��ͼ����
%fun = 2  ֱ��ͼƥ��
%Ĭ�ϵ���Ϊֱ��ͼ����
%YΪ�����ƥ��ֱ��ͼ
clc
clear all
close all

%example    Output = myHisteq(Input��Ϊֱ��ͼƥ�书��
%           Output = myHisteq(Input,fun,Y) Ϊֱ��ͼ���⹦��  fun�����Ͽ���Ϊ����ֵ���fun = 2�� YΪĿ��ֱ��ͼ
% if nargin < 2 
%    fun = 1; 
% end
% if nargin > 2 
%    fun = 2;
% end
  fun = 1;
  Input = InputPicture();
  figure
  imhist(Input);
[lenth,width] = size(Input);
Output = zeros(lenth,width);
%������Ҷȼ������ܶ�
CDF = caculateCDF(Input);
if fun == 2
    %ֱ��ͼƥ��

    %˫��˹��������
    Y = zeros(1,256);
    Y1 = myGaussFun(0:127,30,30);
    Y2 = myGaussFun(0:127,80,15);
    Y(:,1:128) = Y1;
    Y(:,129:256) = 0.1*Y2;
  %  Y = myGaussFun(0:255,180,100);
    Y = Y/sum(Y); %��һ��
    figure
    plot(1:256,Y)
    CDFRef = zeros(1,256);
    CDFRef(1)=Y(1);
    for i=2:256;
        CDFRef(i)= Y(i)+CDFRef(i-1);
    end

    X = zeros(1,256);
    for i=1:256
       [x,n] = min(abs(CDF(i) - CDFRef));
       X(i) = n-1;  %�γɱ任ӳ��
    end
    for i=1:lenth
        for j=1:width
            Output(i,j) = X(Input(i,j)+1);%��һ�Ҷȱ任
        end
    end
end
if fun == 1
    %ֱ��ͼ����
    Eq = round(CDF*255);%�γɱ任ӳ��
    for i=1:lenth
        for j=1:width
            Output(i,j) = Eq(Input(i,j)+1);%��һ�Ҷȱ任
        end
    end
end
Output = uint8(Output);
figure
imhist(Output);
figure
imshow(Output)

% Iout=histeq(Input,Y); % matlab�Դ�ֱ��ͼƥ��
% % Iout = histeq(Input);
% figure
% imhist(Iout);
% figure
% imshow(Iout)













