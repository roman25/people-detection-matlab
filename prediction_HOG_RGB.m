close all
clear all
clc

tic 

%% classification
load('hogRGB');

ResPos={};
ResNeg={};

countPos = 0;
countNeg = 0;


%% reading images to matrix
for num=1:1126
    I = imread(['C:\Users\Домашний\Desktop\INRIAPerson\test_64x128_H96\pos\0 (', num2str(num), ').png']);
    I = imresize(I, [128 64]);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(hogRGB,features);
    if (strcmp(Class, 'person')==1)
       countPos = countPos+1;
    end
    
    ResPos{num} = Class;

end

for count=1:300
    I = imread(['C:\Users\Домашний\Desktop\INRIAPerson\test_64x128_H96\neg\0 (', num2str(count), ').png']);
    I = imresize(I, [128 64]);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(hogRGB,features);
    if (strcmp(Class, 'any')==1)
       countNeg = countNeg+1;
    end
    
    ResNeg{count} = Class;
end

countPos
countNeg

toc