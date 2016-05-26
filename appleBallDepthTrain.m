close all
clear all
clc

tic

picture = 0;

for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\apple\apple_1\apple_1_1_',num2str(num), '_depthcrop.png']);
    I = imresize(I, [70 70]);
    I = double(I);
    features = extractHOGFeatures(I);
    my_depth(picture,:) = features;
end


% ball
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\ball\ball_1\ball_1_1_', num2str(num), '_depthcrop.png']);
    I = imresize(I, [70 70]);
    I = double(I);
    features = extractHOGFeatures(I);
    my_depth(picture,:) = features;

end





%% создание имён групп
ms = {60,1};
for num = 1:30;
    ms{num} = 'apple';
end

for num = 31:60;
    ms{num} = 'ball';
end


ms = ms';

%% обучение
apple_ball_HOG_Depth = svmtrain(my_depth,ms);

toc