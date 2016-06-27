function valueldp = getldp(img, numCells, cellSize)

img = imresize(img, [45 45]);
[rows, cols] = size(img);
img = double(img);
data = [];
count = 1;
for i = 1:cellSize:rows-rem(rows, cellSize)
    for j = 1:cellSize:cols-rem(cols, cellSize)
         averData = aver( img(i:i+cellSize-1, j:j+cellSize-1) );
         data(count) = averData;
         count = count+1;
    end
end

desc = [];

value = 1;
[r, c] = size(data);
dataSize = r*c;
for i = 1:dataSize
    for j = i:dataSize
    if (i==j)
        continue;
    end
        desc(value) = (abs(data(i)-data(j)));
        value = value+1;
    
    end
end
	

[row, col] = size(desc);
descSize = row*col;

descriptor = [];

for i = 1:descSize
    descriptor(i) = desc(i);
end
	

valueldp = descriptor;
end