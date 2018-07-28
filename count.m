function [num] = count(array1,array2)
%every component of num (output) respectively record the numbers od a-t£¬c-g bind & a-g/a-a/g-g & t-c/t-t/c-c & a-c/t-g
%considering nuleotide base group's volume
num=zeros(5,1);
lt=length(array1);
for i=1:1:lt
    a=array1(i);b=array2(i);
    num=diff0(a,b,num);
end

end

