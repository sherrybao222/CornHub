function dict=preselector(full,PAM,length_target)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
for i=1:1:length(full)-2
    c=full(i:1:i+2);
    if (c(1)==PAM(1)) && (c(2)==PAM(2)) && (c(3)==PAM(3))
        dict=[dict full(i,i+length_target-1)];
    end
end
end

