%matlab time complexity
sum = zeros(3,3);
Input = zeros(256,256);
tic

for i = 2:255;
    for j = 2:255;
        sum = Input(i-1:i+1,j-1:j+1);
    end
end
toc