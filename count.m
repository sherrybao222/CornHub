function [num] = count(array1,array2)
%every component of num (output) respectively record the numbers of a-t��c-g bind & a-g/a-a/g-g & t-c/t-t/c-c & a-c/t-g
%considering nucleotide base group's volume
%array1 and array2 is two array which need to be compared and count different coupling

num=zeros(5,1);
lt=length(array1);
for i=1:1:lt
    %a means the i st nucleotide of array1, b means the i st nucleotide of array2
    a=array1(i);b=array2(i);
    num=diff0(a,b,num);
end

end

