close all
clear all
clc

tic 

%% classification
load('union_chairs_motos_LBP');

ResPos0={};

countPosA = 0;
countPosB = 0;

myStruct = union_chairs_motos_LBP;
picture = 0;
%% reading DEPTH images to matrix
for num=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\depth\', num2str(num), '.png']);
    
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    test_depth(picture,:) = features;

end

for num=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\motos\depth\', num2str(num), '.png']);
    
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    test_depth(picture,:) = features;

end


picture = 0;
%%  reading RGB images to matrix
for num=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\rgb\', num2str(num), '.jpg']);
    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
   
    test_rgb(picture,:) = features;

end


for count=31:80
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\motos\rgb\', num2str(num), '.jpg']);
    
    features = extractHOGFeatures(I);
    
    test_rgb(picture,:) = features;
end

full_data = [test_depth test_rgb];
%% result

for i = 1:40
    feature = full_data(i, :);
    Class = svmclassify(myStruct,feature);
    if (strcmp(Class, 'chair')==1)
       countPosB = countPosB+1;
    end
    ResPos0{i} = Class;
end

for i = 1:40
    feature = full_data(i, :);
    Class = svmclassify(myStruct,feature);
    if (strcmp(Class, 'moto')==1)
       countPosA = countPosA+1;
    end
    ResPos1{i} = Class;
end
countCH = [num2str(countPosA), ' from ', num2str(50), ' = ', num2str((countPosA/50)*100), '%']
countM = [num2str(countPosB), ' from ', num2str(50), ' = ', num2str((countPosB/50)*100), '%']
toc