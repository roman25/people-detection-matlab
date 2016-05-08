close all
clear all
clc

tic 

%% classification
load('crop_HOG_Depth');

ResPos0={};
ResPos4={};
ResPos10={};
ResPos12={};
ResPos15={};

countPos0 = 0;
countPos4 = 0;
countPos10 = 0;
countPos12 = 0;
countPos15 = 0;

%% reading images to matrix
for num=1:30
    I = imread(['C:\Users\��������\Desktop\folderTest 31-03\posDepth\0\Depth_', num2str(num), '.png']);
    I = I(50:240, 120:200); 
  
    I = imresize(I, [128 64]);
      
    I = double(I);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(crop_HOG_Depth,features);
    if (strcmp(Class, 'person')==1)
       countPos0 = countPos0+1;
    end
    
    ResPos0{num} = Class;

end

for num=101:200
    I = imread(['C:\Users\��������\Desktop\folderTest 31-03\posDepth\4\Depth_', num2str(num), '.png']);
    I = I(80:240, 120:220); 
  
    I = imresize(I, [128 64]);
  
    I = double(I);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(crop_HOG_Depth,features);
    if (strcmp(Class, 'person')==1)
       countPos4 = countPos4+1;
    end
    
    ResPos4{num} = Class;

end

for num=1:30
    I = imread(['C:\Users\��������\Desktop\folderTest 31-03\posDepth\10\Depth_', num2str(num), '.png']);
    I = I(80:240, 120:220); 
  
    I = imresize(I, [128 64]);
      
    I = double(I);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(crop_HOG_Depth,features);
    if (strcmp(Class, 'person')==1)
       countPos10 = countPos10+1;
    end
    
    ResPos10{num} = Class;

end

for num=301:700
    I = imread(['C:\Users\��������\Desktop\folderTest 31-03\posDepth\12\Depth_', num2str(num), '.png']);
    I = I(50:240, 90:270); 
  
    I = imresize(I, [128 64]);
      
    I = double(I);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(crop_HOG_Depth,features);
    if (strcmp(Class, 'person')==1)
       countPos12 = countPos12+1;
    end
    
    ResPos12{num} = Class;

end

for num=101:130
    I = imread(['C:\Users\��������\Desktop\folderTest 31-03\posDepth\15\Depth_', num2str(num), '.png']);
    I = I(30:240, 120:200); 
    I = imresize(I, [128 64]);
    
    I = double(I);
    features = extractHOGFeatures(I);
    
    Class = svmclassify(crop_HOG_Depth,features);
    if (strcmp(Class, 'person')==1)
       countPos15 = countPos15+1;
    end
    
    ResPos15{num} = Class;

end
 
countPos0
countPos4
countPos10
countPos12
countPos15


toc