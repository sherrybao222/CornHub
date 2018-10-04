%parameters
       k1= 1.099e-3 ;
		k2 = 2.76e-3 ;
		k3 = 1e4   ;
		k4 =1.099e-3 ;
		k5 = 2.76e-3;
		k6 =1e3 ;
		k7 =1.26e4;
		k8=1.6e-2;
		k9 =1.66e-5;
		k10=4e-5;
		kd1 = 3.07e-3;
		kd2=1e-5;
		kd3=1e-3 ;
		kd4=1.53e-3;
		kd5 = 2e-2;
		kd6=7.62e-3;
        kd7=1e-2;
        kd8=1e-1;

%set maximun of changements
change_max=1e-4;
%set numbers of changements
change_num=5;

syms t P_J23104 P_arsR ArsR cplx_2 cplx_5 cplx_4 smURFP As cplx_1 cplx_3 sgRNA P_tet
a=k2;
b=draw(k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8);
S=[];
A=[];
for i=1:1:change_num
   
    %k1=k1+rand()*change_max/change_num;
    k2=k2+rand()*change_max/change_num;
    %k3=k3+rand()*change_max/change_num;
    %k4=k4+rand()*change_max/change_num;
    %k5=k5+rand()*change_max/change_num;
    
    fun_tinf=draw(k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8);
    sensi=(fun_tinf-b)/(k2-a);
    a=k2;
    %a=k4;
    b=fun_tinf;
    A=[A a];
    S=[S sensi];   
end
plot(A,S)
function fun_inf = draw(k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8)    
    timespan = [0 24*36000];  %Time span 
    init = [0 0 0 0 0 0 0 0 1 1 1 1];  %Initial values of the functions       

    %ODE settings
    odesettings = odeset('AbsTol', 1e-12, 'RelTol', 1e-6);

%ODEs
%@(t,P_J23104,P_arsR,ArsR,cplx_2,cplx_5,cplx_4,smURFP,As,cplx_1,cplx_3,sgRNA,P_tet)
   odefunc=@(t,f)[k1*f(9)-kd1*f(11)*f(1);
     k2*f(11)+k10*f(8)-kd2*f(2);
    k3*f(1)*f(11)-k7*f(12)*f(3)-kd3*f(3);
  k4*f(10)-k8*f(4)*f(5)-kd5*f(4);
    k5*f(10)-k8*f(4)*f(5)-kd6*f(5);
   k6*f(12)*f(1)+k7*f(12)*f(3)-kd4*f(6);
     k8*f(4)*f(5)-k9*f(7)*f(11)-kd7*f(7);
    k9*f(7)*f(11)-kd8*f(8);
    0;
    0;
    0;
   -k6*f(12)*f(1)-k7*f(12)*f(3)];
   
    %simulating the ODE
    [t,f] = ode15s(odefunc, timespan, init, odesettings);  

    %set output concentration NO
   NO=2;    
     fun_inf=f(end,NO);
     
%    plot(t,f(:,NO));hold on;
  end
  




