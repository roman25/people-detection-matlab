close all
clear all
clc

tic 

%% classification
load('apple_ball_HOG_Depth');

ResPos0={};

countPos0 = 0;
countPos4 = 0;
countPos10 = 0;
countPos12 = 0;
countPos15 = 0;

myStruct = apple_ball_HOG_Depth;

%% reading images to matrix
for num=1:200
    I = imread(['C:\Users\Домашний\Desktop\rgbd-dataset\apple\apple_5\apple_5_4_', num2str(num), '_depthcrop.png']);
    
  
    I = imresize(I, [70 70]);
      
    I = double(I);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'apple')==1)
       countPos0 = countPos0+1;
    end
    
    ResPos0{num} = Class;

end


 

Pos0 = [num2str(countPos0), ' from ', num2str(num), ' = ', num2str((countPos0/num)*100), '%']

toc