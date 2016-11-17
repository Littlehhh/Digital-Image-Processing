% Input = zeros(2000,2000);
% mask = ones(10,10);
% Input(40:49,40:49) = mask;
Input = myGaussian2D(60,60);
% Input = myRect2D(600,600,10000,2);
% Out = myFraunhofer_diffraction(Input,532,10000);
% Out = myFresnel_diffraction(Input,532,880);
close all
pause('on');
figure
for i=880:1000;
    Out = myFresnel_diffraction(Input,532,i);
    title(['z=',num2str(i),'mm']);
    pause(0.01);
end
% close all
% pause('on');
% figure
% for i=5000:200:50000;
%     Out = myFraunhofer_diffraction(Input,532,i);
%     title(['z=',num2str(i),'mm']);
%     pause(0.01);
% end