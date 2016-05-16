close all
clear all
clc

tic 

%% classification
load('apple_ball_HOG_RGB');

ResPos={};
ResNeg={};

countPos = 0;
countNeg = 0;

myStruct = apple_ball_HOG_RGB;
%% reading images to matrix
for num=1:20
    I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\apple\apple_RGB\0 (', num2str(num), ').jpg']);
    I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'apple')==1)
       countPos = countPos+1;
    end
    
    ResPos{num} = Class;

end

for count=1:20
    I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\ball\ball_RGB\0 (', num2str(num), ').jpg']);
    I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'ball')==1)
       countNeg = countNeg+1;
    end
    
    ResNeg{count} = Class;
end


apple = [num2str(countPos), ' from 20 = ', num2str((countPos/20)*100), '%']
ball = [num2str(countNeg), ' from 20 = ', num2str((countNeg/20)*100), '%']

toc