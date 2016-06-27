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
    mapping=getmapping(8,'u2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_base(picture,:) = features;

end

for count=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\bicycle\depth\', num2str(count), '.png']);
    I = double(I);
    mapping=getmapping(8,'u2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_base(picture,:) = features;

end

%% create names of groups
ms = {60,1};
for num = 1:30;
    ms{num} = 'chairs';
end

for num = 31:60;
    ms{num} = 'bicycle';
end

ms = ms';



%% training
small_chairs_bicycle_lbp = svmtrain(my_base,ms);

toc