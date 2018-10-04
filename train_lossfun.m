function loss_out = train_lossfun(target_dict,score_dict)
%this function used for calculate loss function
loss=[];
%loss funciton can be regared as loss(para),so our problem can be transformed to 'loss(para)=0'
%dictionary 具体形式待定
for i=1:1:length(target_dict)
    target=target_dict(i);
    score=possible(target);
    lf0=-score*ln(score_dict(i));
    loss=[loss lf0];
end
loss_out=sum(loss);
end

