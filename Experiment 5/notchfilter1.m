%�ݲ��˲���
%
close all;
clc;
%picture1 = imread('Fig0322(a).tif');
picture1 = InputPicture();
imshow(picture1,'InitialMagnification','fit');%��ʾԭͼ��
title('ԭͼ��');
%����Ҷ�任����λ
Fpicture1 = abs(fftshift(fft2(double(picture1))));
figure;
imshow(Fpicture1,[],'InitialMagnification','fit');%��ʾ������λ���Ƶ��
title('������λ���Ƶ��');
%�����任
Lpicture1 =log(Fpicture1+1);
figure;
imshow(Lpicture1,[],'InitialMagnification','fit');%ȡ�����任���Ƶ��
title('�����任���Ƶ��');
n=2;
[row1,column1] = size(Lpicture1);

% %��ͨ�˲���
% H1 = ones(row1,column1);
% r = min(row1,column1)/12;
% rx1 = r;ry1 = column1/2;
% % u0=row1/2;v0=column1/2;
% for u=1:row1
%     for v=1:column1
%         if ((rx1-u)^2+(ry1-v)^2) <= r*r;
%             H1(u,v) = 0;
%         elseif (row1-rx1-u)^2+(column1-ry1-v)^2<=r*r;
%             H1(u,v) = 0;
%         else
%             H1(u,v) = 1;
%         end
%     end
% end

%������˹�ݲ���  
for u=1:row1
    for v=1:column1
        D = 20;        
        uk = 159;
        vk=255;
        Dka = ((u-row1/2-uk)^2+(v-column1-vk)^2)^(1/2);   %�㣨u,v�����ݲ�������(u0,v0)�ľ���
        H1(u,v) = 1./(1+(D/Dka)^(2*n));  
%         Dkb = ((u-row1/2+uk)^2+(v-column1+vk)^2)^(1/2);   %�㣨u,v�����ݲ������ģ�-u0,-v0���ľ���
%         H1(u,v) = 1./(1+(D/Dka)^(2*n)); 
    end
end

result_picture = Lpicture1*H1;
%result_picture = fft2(double(picture1)).*H1;
ff = ifftshift(result_picture);
FF = abs(ifft2(ff));
figure;
imshow(FF,[],'InitialMagnification','fit');
