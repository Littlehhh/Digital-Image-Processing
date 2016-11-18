
Input = myGaussian2D(60,60);%生成高斯光

close all
pause('on');
figure
%在 880到1000 范围内观察变化
for i=880:1000;
    Out = myFresnel_diffraction(Input,532,i);
    title(['菲涅尔衍射 z=',num2str(i),'mm']);
    pause(0.01);
end
close all
pause('on');
figure
%在 4000到50000 范围内观察变化
for i=200:200:50000;
    Out = myFraunhofer_diffraction(Input,532,i);
    title(['夫琅和费衍射 z=',num2str(i),'mm']);
    pause(0.01);
end