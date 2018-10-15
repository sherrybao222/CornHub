para=[1,10,20,1]*0.03;

alpha=count(target,cor);
%every parameter means diff. base-binding cause correspondng energy-donation proportion  
    
energy=-2*para(1)*alpha(1)-3*para(1)*alpha(2)+para(2)*alpha(3)+para(3)*alpha(4)+para(4)*alpha(5);
    
%a is a logistic regression type, transfer a unlitmit varible to a possibliy expression 
a=1/(1+exp(energy));
poss_acc=;
lossfun=@(x1,x2)(x1-x2)^2;
while lossfun>1e-4
    grad(1)=(lossfun(a(x1+1e-4,~))-loss(a(x1,~)))/1e-4;
    grad(2)
    grad(3)
    grad(4)
    grad(5)
    para=para-dot(lr,grad);
end

