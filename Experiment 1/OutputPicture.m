function OutputPicture(Output)
%ͼ�񱣴溯�� 
%����ϵͳ�ļ�����ѡ��ͼ��洢λ�ü��ļ���
[FileName,PathName,FilterIndex] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Save Image',...
          'newfile.jpg');%��ȡ�洢·�����ļ���
%��ֹ�û�ȡ������ʱ����
if FilterIndex == 0 %�ж��û��Ƿ�ȡ������
    
else
    imwrite(Output,strcat(PathName,FileName));
end