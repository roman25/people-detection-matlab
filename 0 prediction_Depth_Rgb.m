close all
clear all
clc

tic 

%% classification
load('union_chairs_motos_LBP');



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

countmoto = 0;
countchair = 0;


for i = 1:50
    feature = full_data(i, :);
    Class = svmclassify(myStruct,feature);
    if (strcmp(Class, 'chair')==1)
       countchair = countchair+1;
    end
    ResPosCH{i} = Class;
end

for i = 51:100
    feature = full_data(i, :);
    Class = svmclassify(myStruct,feature);
    if (strcmp(Class, 'moto')==1)
       countmoto = countmoto+1;
    end
    ResPosM{i} = Class;
end
countM = [num2str(countmoto), ' from ', num2str(50), ' = ', num2str((countmoto/50)*100), '%']
countCH = [num2str(countchair), ' from ', num2str(50), ' = ', num2str((countchair/50)*100), '%']
toc