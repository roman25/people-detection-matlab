function himetric = gethi_square(hist1, hist2)
    count = 0;
for i = 1:length(hist1)
    count = count + ((hist1(i)-hist2(i))^2/hist1(i))
end
himetric = count;
end