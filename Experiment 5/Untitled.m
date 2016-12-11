x = zeros(250,250);
for i = 25:24:240

    x(20:230,i:i+6)=1;
    
end
imshow(x);