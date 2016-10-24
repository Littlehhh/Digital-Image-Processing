function OutputPicture(Output)
%图像保存函数 
%调用系统文件管理选择图像存储位置及文件名
[FileName,PathName,FilterIndex] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Save Image',...
          'newfile.jpg');%获取存储路径及文件名
%防止用户取消保存时报错
if FilterIndex == 0 %判断用户是否取消保存
    
else
    imwrite(Output,strcat(PathName,FileName));
end