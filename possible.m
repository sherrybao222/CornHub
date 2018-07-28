function score = possible(para,target)
%this function is transformed from "re0.m" some details can refer to its annotation
%for this function, it's input is a target array and a specific parameter array
%full array is a fixed file(don't change in a certain training process)
%it's output is a score which means the possiblity of cutting
data_path_1='C:\Users\StargazerSaki\Desktop\model\full.txt';
%data_path_2='C:\Users\StargazerSaki\Desktop\model\target.txt';
fid=fopen(data_path_1,'r');
bb=textscan(fid,'%s');
fclose(fid); 
full=cell2mat(bb{1});
%fid=fopen(data_path_2,'r');
%bb=textscan(fid,'%s');
%fclose(fid);
%target=cell2mat(bb{1});
target=fliplr(seqrcomplement(target));
record=[];
len_full=length(full);
len_target=length(target);
%for t=1:1:len_full-len_target+1
for t=1:1:2000
    cor=full(t:t+len_target-1);
    alpha=count(target,cor);
    energy=-2*para(1)*alpha(1)-3*para(1)*alpha(2)+para(2)*alpha(3)+para(3)*alpha(4)+para(4)*alpha(5);
    a=1/(1+exp(energy));
    E=[];
    for m=1:1:len_target
        a1=target(1:m);a2=cor(1:m);
        alpha=count(a1,a2);
        energy=-2*para(1)*alpha(1)-3*para(1)*alpha(2)+para(2)*alpha(3)+para(3)*alpha(4)+para(4)*alpha(5);
        %a=1/(1+exp(energy));
        E=[E energy];
        if energy>0
            E=zeros(len_target,1);
            break
        end
        A=1/(1+exp(energy));
    end
   % for n=1:1:length(E)
   %     if E(n)>0
   %         E=zeros(length(E),1);
   %         break
   %     end
   % end
    %plot(1:1:length(A),A,'linewidth',1.5);hold on;
    %record=[record alpha];
    %record=[record -energy];
    %record=[record a];6
end
%plot(1:1:length(record),record)
m=0;
for t=1:1:length(A)
    
    if A(t)>0.1
        A1(m)=A(t);
        m=m+1;
    else
        m=m;
    end
end
    
poss=max(A);
%bayes rule;
falus_fix=max(A1)/sum(A1);
%there, we make a priori that score funciton£¨temporary£©,aim to express when the miscut more£¬possibility lower£¬and have a  lower score
score=(1-falus_fix)*poss;
end

