function [num] = count(array1,array2)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%count�������ֱ��¼a-t��c-g bind�� �� a-g/a-a/g-g,t-c/t-t/c-c,a-c/t-g��
num=zeros(5,1);
lt=length(array1);
for i=1:1:lt
    a=array1(i);b=array2(i);
    num=diff0(a,b,num);
end

end

