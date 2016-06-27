close all
clear all
clc

tic 

%% classification
load('union_LDP_plants_table');
myStruct = union_LDP_plants_table;

class1 = 'plants';
class2 = 'table';

picture = 0;
%% reading DEPTH images to matrix
for num=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\depth\', num2str(num), '.png']);
    
    I = double(I);
   I = imresize(I, [45 45]);
    features = ldp(I, 5, 9);
    test_depth(picture,:) = features;

end

for num=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\depth\', num2str(num), '.png']);
    
    I = double(I);
    I = imresize(I, [45 45]);
    features = ldp(I, 5, 9);
    test_depth(picture,:) = features;

end


picture = 0;
%%  reading RGB images to matrix
for num=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\rgb\', num2str(num), '.jpg']);
    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    test_rgb(picture,:) = features;

end


for count=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\rgb\', num2str(count), '.jpg']);
    
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    test_rgb(picture,:) = features;
end

full_data = [test_depth test_rgb];
%% result

countsofa = 0;
countsculpt = 0;


for i = 1:50
    feature = full_data(i, :);
    Class = svmclassify(myStruct,feature);
    if (strcmp(Class, class1)==1)
       countsculpt = countsculpt+1;
    end
    ResPos0{i} = Class;
end

for i = 51:100
    feature2 = full_data(i, :);
    Class = svmclassify(myStruct,feature2);
    if (strcmp(Class, class2)==1)
       countsofa = countsofa+1;
    end
    ResPos1{i} = Class;
end

ResPos0 = ResPos0';
ResPos1 = ResPos1';

LDPplants = [num2str(countsculpt), ' from ', num2str(50), ' = ', num2str((countsculpt/50)*100), '%']
LDPtable = [num2str(countsofa), ' from ', num2str(50), ' = ', num2str((countsofa/50)*100), '%']

toc