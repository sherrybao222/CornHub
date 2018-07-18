clc
clear
data_path_1='C:\Users\StargazerSaki\Desktop\model\full.txt';
data_path_2='C:\Users\StargazerSaki\Desktop\model\target.txt';
fid=fopen(data_path_1,'r');
bb=textscan(fid,'%s');
fclose(fid);
full=cell2mat(bb{1});
fid=fopen(data_path_2,'r');
bb=textscan(fid,'%s');
fclose(fid);
target=cell2mat(bb{1});
target=fliplr(seqrcomplement(target));
record=[];
len_full=length(full);
len_target=length(target);
%for t=1:1:len_full-len_target+1
for t=1:1:2000
    cor=full(t:t+len_target-1);
    alpha=count(target,cor);
    energy=-2*alpha(1)-3*alpha(2)+10*alpha(3)+20*alpha(4)+1*alpha(5);
    a=1/(1+exp(energy));
    E=[];
    for m=1:1:len_target
        a1=target(1:m);a2=cor(1:m);
        alpha=count(a1,a2);
        energy=-2*alpha(1)-3*alpha(2)+10*alpha(3)+20*alpha(4)+1*alpha(5);
        a=1/(1+exp(energy));
        E=[E energy];
        if energy>0
            E=zeros(len_target,1);
            break
        end
    end
   % for n=1:1:length(E)
   %     if E(n)>0
   %         E=zeros(length(E),1);
   %         break
   %     end
   % end
    plot(1:1:length(E),E,'linewidth',1.5);hold on;
    %record=[record alpha];
    %record=[record -energy];
    %record=[record a];
end
%plot(1:1:length(record),record)

