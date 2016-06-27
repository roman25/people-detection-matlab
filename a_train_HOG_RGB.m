close all
clear all
clc

tic 

%% reading images to matrix
picture = 0;

class1 = 'chairs';
class2 = 'moto';

for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\rgb\', num2str(num), '.jpg']);
    I = double(I);
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    my_base(picture,:) = features;

end

for count=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\rgb\', num2str(count), '.jpg']);
    I = double(I);
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    my_base(picture,:) = features;

end

%% create names of groups
ms = {60,1};
for num = 1:30;
    ms{num} = class1;
end

for num = 31:60;
    ms{num} = class2;
end

ms = ms';


%% training
small_chairs_moto_hog = svmtrain(my_base,ms);


toc