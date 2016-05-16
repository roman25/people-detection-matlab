close all
clear all
clc

tic

picture = 0;


for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\��������\Desktop\rgbd-dataset\apple\apple_RGB\rgbTrain\0 (', num2str(num), ').jpg']);

    I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end




    
% neg examples
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\��������\Desktop\rgbd-dataset\ball\ball_RGB\rgbTrain\0 (', num2str(num), ').jpg']);

    I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end






%% �������� ��� �����
ms = {60,1};
for num = 1:30;
    ms{num} = 'apple';
end

for num = 31:60;
    ms{num} = 'ball';
end


ms = ms';

%% ��������
apple_ball_HOG_RGB = svmtrain(my_base,ms);

toc