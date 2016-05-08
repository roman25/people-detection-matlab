close all
clear all
clc


tic 

%load('lbp_rgb');
%load('hog_rgb');
%load('full_lbpDepth');
 load('crop_LDP');

%% добавление изображения и его классификация
Res={};


count = 0;
for i = 101:130
    
    I = imread(['C:\Users\Домашний\Desktop\folderTest 31-03\posDepth\15\Depth_', num2str(i), '.png']);
    %I = rgb2gray(I);
    %I = imresize(I, [128 64]);
    I = I(30:240, 110: 240);
  figure, imshow(I);
    
   I = imresize(I, [45 45]);
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
         H = ldp(I, 5, 9);
   
    Class = svmclassify(crop_LDP,H);
    if (strcmp(Class, 'person')==1)
       count = count+1;
       %figure,imshow(image);
    end
    Res{i} = Class;
  
end
Res = Res';
count


toc