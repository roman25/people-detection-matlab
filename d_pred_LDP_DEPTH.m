close all
clear all
clc

tic 

%% classification
load('LDP_small_chairs_moto');

countPos = 0;
countNeg = 0;

class1 = 'chairs';
class2 = 'moto';

myStruct = LDP_small_chairs_moto;
%% reading images to matrix
for num=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\depth\', num2str(num), '.png']);
    I = imresize(I, [45 45]);
    features = ldp(I, 5, 9);
    
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, class1)==1)
       countPos = countPos+1;
    end
    
    Res0{num} = Class;

end

for count=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\depth\', num2str(count), '.png']);
    I = imresize(I, [45 45]);
    features = ldp(I, 5, 9);
    
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