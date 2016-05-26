close all
clear all
clc

tic

picture = 0;


%% depth
% chair
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\depth\',num2str(num), '.png']);
    %I = imresize(I, [70 70]);
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_depth(picture,:) = features;
end


% moto
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\motos\depth\', num2str(num), '.png']);
    %I = imresize(I, [70 70]);
    I = double(I);
    mapping=getmapping(8,'riu2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_depth(picture,:) = features;

end

picture = 0;
%% rgb
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\rgb\', num2str(num), '.jpg']);

    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    my_rgb(picture,:) = features;

end
    
% neg examples
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\motos\rgb\', num2str(num), '.jpg']);

    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I);
    my_rgb(picture,:) = features;

end


my_base = [my_depth my_rgb];

%% создание имён групп
ms = {60,1};
for num = 1:30;
    ms{num} = 'chair';
end

for num = 31:60;
    ms{num} = 'moto';
end


ms = ms';

%% обучение
union_chairs_motos_LBP = svmtrain(my_base,ms);

toc