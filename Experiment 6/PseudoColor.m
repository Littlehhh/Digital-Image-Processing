close all
gray = im2double(imread('Fig0309(a)(washed_out_aerial_image).tif'));

R = gray;
G = gray;
B = gray;
% RGB = cat(3,histeq(R),histeq(G),histeq(B));
 RGB = cat(3,R,G,B);
fig = figure;
imshow(RGB)
while(1)
    dcm_obj = datacursormode(fig);
    set(dcm_obj,'DisplayStyle','datatip','SnapToDataVertex','on','Enable','on');
    pause 
    c_info = getCursorInfo(dcm_obj);
    X = c_info.Position(2);
    Y = c_info.Position(1);
    value = gray(X,Y);
    [X,Y] = find(gray > value-0.05 & gray < value+0.05);
    color = uisetcolor();

    for i = 1:length(X)
        RGB(X(i),Y(i),:) = color;
    %     RGB(X,Y,2) = color(2);
    %     RGB(X,Y,3) = color(3);
    end
    imshow(RGB)
end


