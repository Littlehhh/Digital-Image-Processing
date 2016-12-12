G = zeros(250,250);
for i = 25:24:240

    G(20:230,i:i+6)=1;
    
end
subplot(221);
imshow(G);
title('ԭʼͼ')

F = spfilt(G, 'amean', 3, 3 );
subplot(222);
imshow(F);
title('3*3')
F = spfilt(G, 'amean', 5, 5);
subplot(223);
imshow(F);
title('5*5')
F = spfilt(G, 'amean', 9, 9);
subplot(224);
imshow(F);
title('9*9')
