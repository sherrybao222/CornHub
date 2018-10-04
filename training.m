%training parameter
para1=[1,10,20,1];
para2=[1,20,10,-1];
train_batch=100;
adjust=0.5;
%loss funciton can be regared as loss(para),so our problem can be
%transformed to 'loss(para)=0',use œ“Ωÿ∑®,difference quotient take the place
%of derivation
for t=1:1:train_batch
    grad=train_lossfun(para2)/(train_lossfun(para2)-train_lossfun(para1));
    next=para2-(para2-para1)*grad;
    para1=para2;
    para2=0.5*next+para2;
    if var(para1,para2)<1e-4
        break
    end
end
