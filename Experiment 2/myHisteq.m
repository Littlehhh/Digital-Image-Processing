
clc
close all
clear all
Input = InputPicture();
figure
imhist(Input);

[lenth,width] = size(Input);
Output = zeros(lenth,width);
%计算各灰度级概率密度
CDF = caculateCDF(Input);

%直方图匹配
%双高斯函数生成
Y = zeros(1,256);
Y1 = myGaussFun(0:127,60,40);
Y2 = myGaussFun(0:127,85,25);
Y(:,1:128) = Y1;
Y(:,129:256) = 0.1*Y2;
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
   X(i) = n-1;
end
for i=1:lenth
    for j=1:width
        Output(i,j) = X(Input(i,j)+1);
    end
end


% %直方图均衡
% Eq = round(CDF*255);
% for i=1:lenth
%     for j=1:width
%         Output(i,j) = Eq(Input(i,j)+1);
%     end
% end

Output = uint8(Output);
figure
imhist(Output)
figure
imshow(Output)

Iout=histeq(Input,Y);

figure
imhist(Iout)
figure
imshow(Iout)













