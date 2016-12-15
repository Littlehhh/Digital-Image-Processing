%µÚËÄÌâ
% gray = im2double(InputPicture());
close all
gray = im2double(imread('Fig0309(a)(washed_out_aerial_image).tif'));
figure 
imshow(histeq(gray))
figure 
imshow(gray)
R = gray;
G = gray;
B = gray;
RGB = cat(3,histeq(R),histeq(G),histeq(B));
figure
imshow(RGB)
% % histeq();



