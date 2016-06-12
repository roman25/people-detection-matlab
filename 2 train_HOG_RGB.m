close all
clear all
clc

tic 

%% reading images to matrix
picture = 0;

for num=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\chairs\rgb\', num2str(num), '.jpg']);
    I = double(I);
    I = imresize(I, [64 32]);
    features = extractHOGFeatures(I);
    my_base(picture,:) = features;

end

for count=1:30
    picture = picture + 1;
    I = imread(['C:\Users\Домашний\Desktop\data\motos\rgb\', num2str(count), '.jpg']);
    I = double(I);
    I = imresize(I, [64 32]);
    features = extractHOGFeatures(I);
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


pred = my_base(:, :);
resp = (1:60)'>30;  % Versicolor = 0, virginica = 1
mdl = fitglm(pred,resp,'Distribution','binomial','Link','logit');
scores = mdl.Fitted.Probability;
[X,Y,T,AUC] = perfcurve(ms,scores,'chair');
plot(X,Y);



%% training
%chair_moto_rgb_hog = svmtrain(my_base,ms);



toc