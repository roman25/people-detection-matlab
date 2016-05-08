function averValue = aver(img)

meaning = 0;

[rows, cols] = size(img);
img = double(img);
for i = 1:rows
    for j = 1:cols
        meaning = meaning + img(i, j);
    end
end

averValue = meaning/(rows*cols);
end