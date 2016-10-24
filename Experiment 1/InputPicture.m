function [Input]=InputPicture()
[FileName,PathName,FilterIndex] = uigetfile('*.*');%弹出对话框得到打开的路径
if FilterIndex == 0
    Input=0;
else
    Input=imread(strcat(PathName,FileName));%打开得到的路径下的文件
    figure
    imshow(Input);
    title('原始图像')
end

