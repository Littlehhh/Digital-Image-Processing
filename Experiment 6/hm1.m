%������

% rgb = InputPicture();
rgb = imread('Fig0637(a)(caster_stand_original).tif');
HSI = RGB_to_HSI(rgb);
[h,s,i] = RGB_to_HSI(rgb);
% figure
subplot(221)
imshow(rgb)
subplot(222)
imshow(h)%h����
subplot(223)
imshow(s)%s����
subplot(224)
imshow(i)%i����
Rgb = HSI_to_RGB(h,s,histeq(i));%��ɫֱ��ͼ�����
figure
imshow(Rgb)