function [Input]=InputPicture()
%图像读取函数 
%调用系统文件管理选择图像存储位置及文件
[FileName,PathName,FilterIndex] = uigetfile('*.*');%弹出对话框得到打开的路径

%防止用户取消保存时报错
if FilterIndex == 0%判断用户是否取消保存
    Input=0;
else
    Input=imread(strcat(PathName,FileName));%打开得到的路径下的文件
    figure
    imshow(Input);
    title('原始图像')
end

