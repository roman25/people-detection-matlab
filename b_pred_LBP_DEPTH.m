close all
clear all
clc

tic 

%% classification
load('small_chairs_bicycle_lbp');

ResPos0={};
ResPos1={};

countPosA = 0;
countPosB = 0;

myStruct = small_chairs_bicycle_lbp;

%% reading images to matrix
for num=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\depth\', num2str(num), '.png']);
    %I = imresize(I, [70 70]); 
    I = double(I);
    mapping=getmapping(8,'u2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'chairs')==1)
       countPosA = countPosA+1;
    end
    ResPos0{num} = Class;
end


for count=31:80
    I = imread(['C:\Users\Домашний\Desktop\data\bicycle\depth\', num2str(count), '.png']);
    %I = imresize(I, [70 70]); 
    I = double(I);
    mapping=getmapping(8,'u2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    Class = svmclassify(myStruct,features);
    if (strcmp(Class, 'bicycle')==1)
       countPosB = countPosB+1;
    end
    ResPos1{count} = Class;
end

ResPos0 = ResPos0';
ResPos1 = ResPos1';

qchairs = [num2str(countPosA), ' from ', num2str(50), ' = ', num2str((countPosA/50)*100), '%']
qbicycle = [num2str(countPosB), ' from ', num2str(50), ' = ', num2str((countPosB/50)*100), '%']

toc