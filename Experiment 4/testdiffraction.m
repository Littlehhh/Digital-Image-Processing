
Input = myGaussian2D(60,60);%���ɸ�˹��

close all
pause('on');
figure
%�� 880��1000 ��Χ�ڹ۲�仯
for i=880:1000;
    Out = myFresnel_diffraction(Input,532,i);
    title(['���������� z=',num2str(i),'mm']);
    pause(0.01);
end
close all
pause('on');
figure
%�� 4000��50000 ��Χ�ڹ۲�仯
for i=200:200:50000;
    Out = myFraunhofer_diffraction(Input,532,i);
    title(['���źͷ����� z=',num2str(i),'mm']);
    pause(0.01);
end