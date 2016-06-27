close all
clear all
clc

tic 

%% classification
load('small_chairs_moto_hog');

countPos = 0;
countNeg = 0;

myStruct = small_chairs_moto_hog;

class1 = 'chairs';
class2 = 'moto';


%% reading images to matrix
for num=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\rgb\', num2str(num), '.jpg']);
    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, class1)==1)
       countPos = countPos+1;
    end
    
    Res0{num} = Class;

end

for count=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\rgb\', num2str(count), '.jpg']);
    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, class2)==1)
       countNeg = countNeg+1;
    end
    
    Res1{count} = Class;
end

Res0 = Res0';
Res1 = Res1';

qchairs = [num2str(countPos), ' from 50 = ', num2str((countPos/50)*100), '%']
qmoto = [num2str(countNeg), ' from 50 = ', num2str((countNeg/50)*100), '%']

toc