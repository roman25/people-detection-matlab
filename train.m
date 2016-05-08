close all
clear all
clc


tic 

%my_base = zeros(3434,118);


% for folder = 1000:1132
%     for number = 0:2
%         picture = picture + 1;
%         I = imread(['C:\Users\Домашний\Desktop\rgbd_people_unihall\depth\seq0_', num2str(folder), '_', num2str(number), '.pgm']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         %I = I(30:240, 80:170); 
% 
%         mapping=getmapping(8,'u2'); 
%         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
%         H = [CLBP_SH,CLBP_MH];
%         depth(picture,:) = H;
%     end
% end

%% считывание всех изображений в массив
% pic_count = 147;
% picture = 0;
% 
% for folder = 0:2
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(30:240, 80:170); 
%         I = imresize(I, [45 45]);
%         
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% for folder = 3:3
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(90:240, 120:190); 
%         
%         I = imresize(I, [45 45]);
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% 
% for folder = 4:4
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(80:240, 120:190); 
%         
%         I = imresize(I, [45 45]);
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% 
% for folder = 5:5
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(30:240, 90:190); 
%         
%         I = imresize(I, [45 45]);
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% for folder = 6:6
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(30:240, 90:190); 
%         
%         I = imresize(I, [45 45]);
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% 
% for folder = 7:7
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(30:240, 100:200); 
%         I = imresize(I, [45 45]);
%         
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% for folder = 8:9
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(30:240, 80:170); 
%         
%         I = imresize(I, [45 45]);
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% 
% for folder = 10:10
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(70:240, 80:170); 
%         
%        I = imresize(I, [45 45]);
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% 
% for folder = 11:11
%     for num=1:pic_count
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']);
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(30:240, 80:175); 
%         
%        I = imresize(I, [45 45]);
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% 
% for folder = 12:16
%     for num=1:pic_count
%          picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\', num2str(folder), '\Depth_', num2str(num),'.png']); 
%         %I = double(Img);%imresize(Img, [200 200]);
%         I = I(30:240, 90: 230);
%         
%        I = imresize(I, [45 45]);
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% % neg examples
% for folder = 1:11
%     for num=1:20
%          picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\17\background_', num2str(folder), '_', num2str(num),'_depth.png']); 
%         %I = double(Img);%imresize(Img, [200 200]);
%         %I = I(30:240, 90: 230);
% I = imresize(I, [45 45]);
%        
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% 
%     end
% end
% 
% for num=10:99
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\scene_01\000', num2str(folder), '-depth.png']); 
%         %I = double(Img);%imresize(Img, [200 200]);
%         %I = I(30:240, 90: 230);
% I = imresize(I, [45 45]);
%        
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% end
% 
% for num=10:99
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\scene_05\000', num2str(folder), '-depth.png']); 
%         %I = double(Img);%imresize(Img, [200 200]);
%         %I = I(30:240, 90: 230);
% I = imresize(I, [45 45]);
%        
% %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% end
% 
% for num=10:99
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\scene_09\000', num2str(folder), '-depth.png']); 
%         %I = double(Img);%imresize(Img, [200 200]);
%         %I = I(30:240, 90: 230);
% 
%        I = imresize(I, [45 45]);
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% end
% 
% for num=10:99
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\scene_13\000', num2str(folder), '-depth.png']); 
%         %I = double(Img);%imresize(Img, [200 200]);
%         %I = I(30:240, 90: 230);
% I = imresize(I, [45 45]);
%        
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% end
% 
% 
% for num=10:99
%         picture = picture + 1;
%         I = imread(['D:\Google Диск\Текстовые документы\ИСОиП\Диплом 3D классификация\Реализация\folderTrain\scene_14\000', num2str(folder), '-depth.png']); 
%         %I = double(Img);%imresize(Img, [200 200]);
%         %I = I(30:240, 90: 230);
% 
%        I = imresize(I, [45 45]);
%  %         mapping=getmapping(8,'riu2'); 
% %         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% %         H = [CLBP_SH,CLBP_MH];
%         H = ldp(I, 5, 9);
%         my_base(picture,:) = H;
% end
% 
% 
% %% создание имён групп
% ms = {3169,1};
% for num = 1:2499;
%     ms{num} = 'person';
% end
% 
% for num = 2500:3169;
%     ms{num} = 'any';
% end
% 
% 
% ms = ms';
% 
% %% обучение
% crop_LDP = svmtrain(my_base,ms);




% for numImg=1:2416
%         picture = picture + 1;
%         I = imread(['C:\Users\Домашний\Desktop\INRIAPerson\train_64x128_H96\pos\0 (', num2str(numImg), ').png']);
%         
%         mapping=getmapping(8,'riu2'); 
%         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
%         H = [CLBP_SH,CLBP_MH];
%         my_base(picture,:) = H;
% 
% end
% 
% picture = 2416;
% 
% for numImg=1:912
%         picture = picture + 1;
%         I = imread(['C:\Users\Домашний\Desktop\INRIAPerson\train_64x128_H96\neg\0 (', num2str(numImg), ').png']);
%        
%         mapping=getmapping(8,'riu2'); 
%         [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
%         H = [CLBP_SH,CLBP_MH];
%         my_base(picture,:) = H;
% 
% end
% 
% 
% %% создание имён групп
% ms = {3328,1};
% for num = 1:2416;
%     ms{num} = 'person';
% end
% 
% for num = 2417:3328;
%     ms{num} = 'any';
% end
% 
% 
% ms = ms';
% 
% %% обучение
% lbp_rgb = svmtrain(my_base,ms);

toc