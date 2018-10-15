%转化部分
clc
clear
data_path_1='C:\Users\StargazerSaki\Desktop\iGem\full.txt';
data_path_2='C:\Users\StargazerSaki\Desktop\iGem\target.txt';
fid=fopen(data_path_1,'r');
bb=textscan(fid,'%s');
fclose(fid);
text=cell2mat(bb{1});
fid2=fopen(data_path_2,'r');
aa=textscan(fid,'%s');
fclose(fid);
target=cell2mat(aa{1});
num1=length(text);
num2=length(target);
diff=[];
for i=1:1:num1-num2+1
    eig=0;
    text1=text(i:num2+i-1);
    for j=1:1:num2
        if target(j)==text1(j)
            eig=eig+1;
        else
            eig=eig;
        end
    end
    diff=[diff eig];
end
cor=length(diff);
x=1:1:cor;
plot(x,diff)
grid on
