% cd DB1_B;
%创建数据库
MyFolderInfo = dir('DB1_B\*.tif');

n = size(MyFolderInfo);
for i = 1:n
  
   TF = fingerprint(['DB1_B\',MyFolderInfo(i).name]);
   DataBase(i) = TF;
end
save('DataBase.mat','DataBase');
