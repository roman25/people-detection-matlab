close all
clear all
clc

tic

pic_count = 147;
picture = 0;

for folder = 0:2
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(30:240, 80:170); 
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end

for folder = 3:3
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(90:240, 120:190); 
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


for folder = 4:4
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(80:240, 120:190); 
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


for folder = 5:5
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(30:240, 90:190); 
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end

for folder = 6:6
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(30:240, 90:190);
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


for folder = 7:7
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(30:240, 100:200); 
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end

for folder = 8:9
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(30:240, 80:170); 
       I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


for folder = 10:10
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(70:240, 80:170); 
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


for folder = 11:11
    for num=1:pic_count
        picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
        I = I(30:240, 80:175);
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end


for folder = 12:16
    for num=1:pic_count
         picture = picture + 1;
        I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']); 
        I = I(30:240, 90: 230);
        I = imresize(I, [128 64]);
        I = double(I);
        features = extractHOGFeatures(I);
        my_base(picture,:) = features;

    end
end

% car examples

for num=1:17
     picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\trainCar\0 (', num2str(num),').png']); 
    I = imresize(I, [64 128]);
    I = double(I);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end





%% создание имён групп
ms = {2516,1};
for num = 1:2499;
    ms{num} = 'person';
end

for num = 2500:2516;
    ms{num} = 'car';
end


ms = ms';

%% обучение
car_HOG_Depth = svmtrain(my_base,ms);

toc