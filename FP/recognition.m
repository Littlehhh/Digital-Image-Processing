clc
clear all
load('DataBase.mat')
[Input]=InputPicture();
% Input = imopen(Input,strel('disk',1,8));
Input = imclose(Input,strel('disk',1,8));
% Input = imclose(Input,strel('disk',2,8));
figure
imshow(Input,[]);
[TF] = fingerprint(Input);

n = size(DataBase,2);
result = zeros(1,n);
for i = 1:n
    %º∆À„≈∑ œæ‡¿Î
    result(i) = sqrt((TF.Energy-DataBase(i).Energy)^2 + (TF.Contrast-DataBase(i).Contrast)^2 ...
    + (TF.Homogeneity-DataBase(i).Homogeneity)^2 + (TF.Correlation-DataBase(i).Correlation)^2);

%     result(i) = (TF.Correlation-DataBase(i).Correlation)^2;
end
[distance,number] = min(result)
