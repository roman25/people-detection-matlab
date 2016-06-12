close all
clear all
clc

tic 

%% classification
load('chair_moto_rgb_hog');

ResPos={};
ResNeg={};

countPos = 0;
countNeg = 0;

myStruct = chair_moto_rgb_hog;
%% reading images to matrix
for num=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\rgb\', num2str(num), '.jpg']);
    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'chair')==1)
       countPos = countPos+1;
    end
    
    ResPos{num} = Class;

end

for count=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\motos\rgb\', num2str(count), '.jpg']);
    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'moto')==1)
       countNeg = countNeg+1;
    end
    
    ResNeg{count} = Class;
end


chair = [num2str(countPos), ' from 50 = ', num2str((countPos/50)*100), '%']
moto = [num2str(countNeg), ' from 50 = ', num2str((countNeg/50)*100), '%']

toc