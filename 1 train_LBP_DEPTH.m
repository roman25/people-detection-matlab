close all
clear all
clc

tic 

%% reading images to matrix
picture = 0;

for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\depth\', num2str(num), '.png']);
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_base(picture,:) = features;

end

for count=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\motos\depth\', num2str(count), '.png']);
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_base(picture,:) = features;

end

%% create names of groups
ms = {60,1};
for num = 1:30;
    ms{num} = 'chair';
end

for num = 31:60;
    ms{num} = 'moto';
end

ms = ms';



%% training
%chair_moto_depth_lbp = svmtrain(my_base,ms);

toc