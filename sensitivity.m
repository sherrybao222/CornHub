%parameters
       k1= 1.999e-5 ;
		k2 = 3.312e-6;
		k3 = 3.3e7   ;
		k4 =1.995e-5 ;
		k5 = 3.312e-6 ;
		k6 =1.66e7  ;
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
change_max=1e-1
%set numbers of changements
change_num=10


a=k1;
b=odefunc(t,f,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8)
for i=1:1:change_max
    k1=k1+rand()*change_max/change_num;
    fun_tinf=odefunc(t,f,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8);
    sensi=(fun_tinf-b)/(k1-a);

    a=k1;
    b=fun_tinf;
end

function fun_inf = odefunc(t,f,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8)    
    timespan = [0 24*3600];  %Time span 
    init = [0 0 0 0 0 0 0 0 1 1 1 1];  %Initial values of the functions       

    %ODE settings
    odesettings = odeset('AbsTol', 1e-12, 'RelTol', 1e-6);


     %Functions
    ArsR = f(1);
   smURFP = f(2);
    cplx_1= f(3);
    cplx_3 = f(4);
      sgRNA = f(5);
   cplx_2 = f(6);
    cplx_4= f(7);
    cplx_5 = f(8);
    P_J23104=f(9);
    P_tet=f(10);
    P_arsR=f(11);
    As=f(12);
    %parameters
%ODEs
   odefunc=@(t,f)[k1*P_J23104-kd1*P_arsR*ArsR;
     k2*P_arsR+k10*cplx_5-kd2*smURFP;
    k3*ArsR*P_arsR-k7*As*cplx_1-kd3*cplx_1;
  k4*P_tet-k8*cplx_3*sgRNA-kd5*cplx_3;
    k5*P_tet-k8*cplx_3*sgRNA-kd6*sgRNA;
   k6*As*ArsR+k7*As*cplx_1-kd4*cplx_2;
     k8*cplx_3*sgRNA-k9*cplx_4*P_arsR-kd7*cplx_4;
    k9*cplx_4*P_arsR-kd8*cplx_5;
    0;
    0;
    0;
   -k6*As*ArsR-k7*As*cplx_1];
    %simulating the ODE
    [t,f] = ode15s(@odefunc, timespan, init, odesettings);  
    fun_inf=f(k1,1)
    plot(t,f(:,1));hold on;
  end
  




