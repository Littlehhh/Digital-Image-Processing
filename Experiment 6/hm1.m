%第三题

% rgb = InputPicture();
rgb = imread('Fig0637(a)(caster_stand_original).tif');
HSI = RGB_to_HSI(rgb);
[h,s,i] = RGB_to_HSI(rgb);
% figure
subplot(221)
imshow(rgb)
subplot(222)
imshow(h)%h分量
subplot(223)
imshow(s)%s分量
subplot(224)
imshow(i)%i分量
Rgb = HSI_to_RGB(h,s,histeq(i));%彩色直方图均衡后
figure
imshow(Rgb)