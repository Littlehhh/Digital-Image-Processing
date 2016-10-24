function OutputPicture(Output)
[FileName,PathName,FilterIndex] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Save Image',...
          'newfile.jpg');
if FilterIndex == 0
    
else
    imwrite(Output,strcat(PathName,FileName));
end