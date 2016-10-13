clc
close all
clear all
aim = zeros(61,61);
Input = InputPicture();
%aim = Input(7:68,188:249);
%aim = Input(189:250,188:249);
%aim = Input(98:159,98:159);
aim = Input(189:250,7:68);
[lenth,width] = size(aim);
CDF = caculateCDF(aim);

%¾ùºâ
Eq = round(CDF*255);%/numel(Input);
%RPDF = Eq.*num;
Output = zeros(lenth,width);
for i=1:lenth
    for j=1:width
        Output(i,j) = Eq(aim(i,j)+1);
    end
end
Output = uint8(Output);
Output = resizeNEAREST(10,10,Output);
figure
imhist(Output)
figure
imshow(Output)