clc
clear all
close all
H = 3;
W = 3;
Input = InputPicture();
Output = resizeNEAREST(H,W,Input);
Output1 = resizeLINEAR(H,W,Input);
Output2 = resizeLINEAR2(H,W,Input);
out = imresize(Input,H,'nearest');
out2 = imresize(Input,H,'bilinear');
figure
imhist(Output)
figure
imhist(out)
figure
imhist(Output1)
figure
imhist(Output2)
figure
imhist(out2)

Compare = out-Output;
figure
surf(Compare)
Compare1 = out2-Output1;
figure
surf(Compare1)
Compare2 = out2-Output2;
figure
surf(Compare2)


sum(sum(Compare1))
sum(sum(Compare2))
[m,n] = size(Input);
sumPix = m*n;
[m,n] = size(Output2);
sumPix2 = m*n;
[m,n] = size(out2);
sumPix1 = m*n;
%CERF1(1)=0;
%CERF2(1)=0;
CERF1=zeros(1,256);
CERF2=zeros(1,256);

for i=1:256;
    P(i) = sum(histc(Input,i-1))/sumPix;
    F1(i) = sum(histc(out2,i-1))/sumPix1;
    F2(i) = sum(histc(Output2,i-1))/sumPix2;
end
    %CERF1(i+1)= P(i)*log(P(i)/F1(i))+CERF1(i);
   % CERF2(i+1)= P(i)*log(P(i)/F2(i))+CERF2(i);
    CERF1= P.*log(P./F1)+CERF1;
    CERF2= P.*log(P./F2)+CERF2;
    CERF1(isnan(CERF1))=0;
    CERF2(isnan(CERF2))=0;
    R1=sum(CERF1)
    R2=sum(CERF2)