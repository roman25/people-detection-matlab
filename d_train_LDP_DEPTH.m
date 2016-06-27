close all
clear all
clc

tic 

%% reading images to matrix
picture = 0;

class1 = 'chairs';
class2 = 'moto';

for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class1, '\depth\', num2str(num), '.png']);
    I = double(I);
    I = imresize(I, [45 45]);
    features = ldp(I, 5, 9);
    my_base(picture,:) = features;

end

for count=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\', class2, '\depth\', num2str(count), '.png']);
    I = double(I);
    I = imresize(I, [45 45]);
    features = ldp(I, 5, 9);
    my_base(picture,:) = features;

end

%% create names of groups
ms = {60,1};
for num = 1:30;
    ms{num} = class1;
end

for num = 31:60;
    ms{num} = class2;
end

ms = ms';


%% training
LDP_small_chairs_moto = svmtrain(my_base,ms);


toc