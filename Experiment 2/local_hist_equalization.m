function Output = local_hist_equalization(Input)
 parpool('local',4);
%局部直方图均衡
% clc
% close all
% clear all
 Input = InputPicture();
 figure
 imhist(Input);

[length,width] = size(Input);
Output = zeros(length,width);


%创建3*3模板
B = zeros(3,3);
tic
parfor i = 2:length-1;
    for j = 2:width-1;
       
       %B = myHisteq(Input(i-1:i+1,j-1:j+1));   %对3*3领域内直方图均衡得到转换函数作用于原图中心点
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