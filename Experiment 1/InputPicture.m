function [Input]=InputPicture()
%ͼ���ȡ���� 
%����ϵͳ�ļ�����ѡ��ͼ��洢λ�ü��ļ�
[FileName,PathName,FilterIndex] = uigetfile('*.*');%�����Ի���õ��򿪵�·��

%��ֹ�û�ȡ������ʱ����
if FilterIndex == 0%�ж��û��Ƿ�ȡ������
    Input=0;
else
    Input=imread(strcat(PathName,FileName));%�򿪵õ���·���µ��ļ�
    figure
    imshow(Input);
    title('ԭʼͼ��')
end

