function [tra] = diff0(a,b,ori)
%distinguish 5 kinds of double base and collect them into ori matrix 
couple=[a b];

if strcmp(couple,'at')==1 | strcmp(couple,'ta')==1
    ori(1)=ori(1)+1;
elseif strcmp(couple,'cg')==1 | strcmp(couple,'gc')==1
    ori(2)=ori(2)+1;
elseif strcmp(couple,'ag')==1 | strcmp(couple,'ga')==1 | strcmp(couple,'aa')==1 | strcmp(couple,'gg')==1   
    ori(3)=ori(3)+1;
elseif strcmp(couple,'tc')==1 | strcmp(couple,'tt')==1 | strcmp(couple,'cc')==1 | strcmp(couple,'ct')==1   
    ori(4)=ori(4)+1;
elseif strcmp(couple,'ac')==1 | strcmp(couple,'tg')==1 | strcmp(couple,'ca')==1 | strcmp(couple,'gt')==1   
    ori(5)=ori(5)+1;
end
tra=ori;
end

