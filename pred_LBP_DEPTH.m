close all
clear all
clc

tic 

%% classification
load('chair_moto_depth_lbp');

ResPos0={};
ResPos1={};

countPosA = 0;
countPosB = 0;

myStruct = chair_moto_depth_lbp;

%% reading images to matrix
for num=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\depth\', num2str(num), '.png']);
    %I = imresize(I, [70 70]); 
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'chair')==1)
       countPosA = countPosA+1;
    end
    ResPos0{num} = Class;
end


for count=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\motos\depth\', num2str(count), '.png']);
    %I = imresize(I, [70 70]); 
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'moto')==1)
       countPosB = countPosB+1;
    end
    ResPos1{num} = Class;
end

ch = [num2str(countPosA), ' from ', num2str(50), ' = ', num2str((countPosA/50)*100), '%']
m = [num2str(countPosB), ' from ', num2str(50), ' = ', num2str((countPosB/50)*100), '%']

toc