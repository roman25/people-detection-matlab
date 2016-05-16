close all
clear all
clc

tic

picture = 0;

for folder = 1:2
    for num=1:199
        picture = picture + 1;
        I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\apple\apple_1\apple_1_',  num2str(folder), '_',num2str(num), '_depthcrop.png']);
        
        I = imresize(I, [70 70]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


for folder = 4:4
    for num=1:199
        picture = picture + 1;
        I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\apple\apple_1\apple_1_',  num2str(folder), '_',num2str(num), '_depthcrop.png']);
        
        I = imresize(I, [70 70]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


% neg examples
for folder = 1:2
    for num=1:273
        picture = picture + 1;
        I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\ball\ball_1\ball_1_',  num2str(folder), '_',num2str(num), '_depthcrop.png']);
        
        I = imresize(I, [70 70]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end





%% создание имён групп
ms = {1143,1};
for num = 1:597;
    ms{num} = 'apple';
end

for num = 598:1143;
    ms{num} = 'ball';
end


ms = ms';

%% обучение
apple_ball_HOG_Depth = svmtrain(my_base,ms);

toc