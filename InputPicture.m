function [Input]=InputPicture()
[FileName,PathName,FilterIndex] = uigetfile('*.*');%�����Ի���õ��򿪵�·��
if FilterIndex == 0
    Input=0;
else
    Input=imread(strcat(PathName,FileName));%�򿪵õ���·���µ��ļ�
    imshow(Input);
end

