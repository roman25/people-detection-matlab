close all
clear all
clc

tic

picture = 0;


%% depth

class1 = 'plants';
class2 = 'table';

for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\depth\',num2str(num), '.png']);
    %I = imresize(I, [70 70]);
    I = double(I);
    mapping=getmapping(8,'u2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_depth(picture,:) = features;
end


% moto
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\depth\', num2str(num), '.png']);
    %I = imresize(I, [70 70]);
    I = double(I);
    mapping=getmapping(8,'u2'); 
    [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
    features = [CLBP_SH,CLBP_MH];
    my_depth(picture,:) = features;

end

picture = 0;
%% rgb
%chairs
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\rgb\', num2str(num), '.jpg']);

    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    my_rgb(picture,:) = features;

end
    
% motos
for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\rgb\', num2str(num), '.jpg']);

    %I = imresize(I, [70 70]);
    features = extractHOGFeatures(I,'CellSize',[128 128]);
    my_rgb(picture,:) = features;

end


my_base = [my_depth my_rgb];

%% создание имён групп
ms = {60,1};
for num = 1:30;
    ms{num} = class1;
end

for num = 31:60;
    ms{num} = class2;
end


ms = ms';

%% обучение
union_LBP_plants_table = svmtrain(my_base,ms);

toc