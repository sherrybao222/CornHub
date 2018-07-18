function [num] = count(array1,array2)
%UNTITLED3 此处显示有关此函数的摘要
%count各分量分别记录a-t，c-g bind数 和 a-g/a-a/g-g,t-c/t-t/c-c,a-c/t-g数
num=zeros(5,1);
lt=length(array1);
for i=1:1:lt
    a=array1(i);b=array2(i);
    num=diff0(a,b,num);
end

end

