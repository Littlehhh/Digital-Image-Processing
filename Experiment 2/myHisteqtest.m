%function Output = myHisteq(Input,fun,Y)
%fun = 1  直方图均衡
%fun = 2  直方图匹配
%默认调用为直方图均衡
%Y为输入的匹配直方图
clc
clear all
close all

%example    Output = myHisteq(Input）为直方图匹配功能
%           Output = myHisteq(Input,fun,Y) 为直方图均衡功能  fun理论上可以为任意值最好fun = 2； Y为目标直方图
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
%计算各灰度级概率密度
CDF = caculateCDF(Input);
if fun == 2
    %直方图匹配

    %双高斯函数生成
    Y = zeros(1,256);
    Y1 = myGaussFun(0:127,30,30);
    Y2 = myGaussFun(0:127,80,15);
    Y(:,1:128) = Y1;
    Y(:,129:256) = 0.1*Y2;
  %  Y = myGaussFun(0:255,180,100);
    Y = Y/sum(Y); %归一化
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
       X(i) = n-1;  %形成变换映射
    end
    for i=1:lenth
        for j=1:width
            Output(i,j) = X(Input(i,j)+1);%逐一灰度变换
        end
    end
end
if fun == 1
    %直方图均衡
    Eq = round(CDF*255);%形成变换映射
    for i=1:lenth
        for j=1:width
            Output(i,j) = Eq(Input(i,j)+1);%逐一灰度变换
        end
    end
end
Output = uint8(Output);
figure
imhist(Output);
figure
imshow(Output)

% Iout=histeq(Input,Y); % matlab自带直方图匹配
% % Iout = histeq(Input);
% figure
% imhist(Iout);
% figure
% imshow(Iout)













