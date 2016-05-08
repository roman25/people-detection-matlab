close all
clear all
clc

tic 

%% reading images to matrix
picture = 0;

for num=1:2416
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\INRIAPerson\train_64x128_H96\pos\0 (', num2str(num), ').png']);
    I = imresize(I, [128 64]);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end

for count=1:912
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\INRIAPerson\train_64x128_H96\neg\0 (', num2str(count), ').png']);
    I = imresize(I, [128 64]);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end

%% create names of groups
ms = {3328,1};
for num = 1:2416;
    ms{num} = 'person';
end

for num = 2417:3328;
    ms{num} = 'any';
end

ms = ms';

%% training
hogRGB = svmtrain(my_base,ms);



