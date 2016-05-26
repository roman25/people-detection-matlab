close all
clear all
clc

tic 

%% reading images to matrix
picture = 0;

for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\rgb\', num2str(num), '.jpg']);
    I = double(I);
    %I = imresize(I, [128 64]);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end

for count=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\motos\rgb\', num2str(count), '.jpg']);
    I = double(I);
   % I = imresize(I, [128 64]);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end

%% create names of groups
ms = {60,1};
for num = 1:30;
    ms{num} = 'chair';
end

for num = 31:60;
    ms{num} = 'moto';
end

ms = ms';

%% training
chair_moto_rgb_hog = svmtrain(my_base,ms);



