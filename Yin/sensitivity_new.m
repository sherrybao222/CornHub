 %parameters
       ktx1= 1.5e-2;
		ktl1 = 7.33e-2;
		ktx2 = 1.5e-2  ;
		ktl2 =1.84e-13 ;
		kb1 = 1e4;
		ktx3 =5e-4 ;
        ktl3=0.072;
        ktx4=1.33e-3;
        kb2=1e3;
		kb3 =1.26e4;
		kb4=1.6e-2;
		kb5=1.66e-5;
		kb6=4e-5;
		kd1 = 3.07e-3;
		kd2=1e-5;
		kd3=1e-3 ;
		kd4=1.53e-3;
		kd5 = 2e-2;
		kd6=7.62e-3;
        kd7=1e-2;
        kd8=1e-1;
        kd9=2.81e-3;
        kd10=7.62e-3;
        kd11=8e-4;
%set maximun of changements
change_max=1;
%set numbers of changements
change_num=5;

syms t P_J23104 P_arsR ArsR cplx_2 cplx_5 cplx_4 smURFP As cplx_1 cplx_3 sgRNA P_tet
a=ktl3;
b=draw(ktx1,ktl1,ktx2,ktl2,kb1,ktx3,ktl3,ktx4,kb2,kb3,kb4,kb5,kb6,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8,kd9,kd10,kd11);
S=[];
A=[];
for i=1:1:change_num
     ktl3=ktl3+rand()*change_max/change_num;
    fun_tinf=draw(ktx1,ktl1,ktx2,ktl2,kb1,ktx3,ktl3,ktx4,kb2,kb3,kb4,kb5,kb6,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8,kd9,kd10,kd11);
    sensi=(fun_tinf-b)/(ktl3-a);

    a=ktl3;
    b=fun_tinf;
    A=[A a];
    S=[S sensi];   
end
 plot(A,S)
function fun_inf = draw(ktx1,ktl1,ktx2,ktl2,kb1,ktx3,ktl3,ktx4,kb2,kb3,kb4,kb5,kb6,kd1,kd2,kd3,kd4,kd5,kd6,kd7,kd8,kd9,kd10,kd11)    
    timespan = [0 1800];  %Time span 
    init = [0 0 0 0 0 0 0 0 1 1 1 1 0 0 0];  %Initial values of the functions       

    %ODE settings
    odesettings = odeset('AbsTol', 1e-12, 'RelTol', 1e-6);

%ODEs
%@(t,P_J23104,P_arsR,ArsR,cplx_2,cplx_5,cplx_4,smURFP,As,cplx_1,cplx_3,sgRNA,P_tet)
   odefunc=@(t,f)[ktl1*f(13)-kd1*f(1);
     ktl2*f(14)+kb6*f(9)-kd2*f(2);
    kb1*f(1)*f(11)-kb3*f(7)*f(3)-kd3*f(3);
  ktl3*f(15)-kb4*f(4)*f(5)-kd5*f(4);
    ktx4*f(12)-kb4*f(4)*f(5)-kd6*f(5);
   kb2*f(7)*f(1)+kb3*f(7)*f(3)-kd4*f(6);
     -kb2*f(7)*f(1)-kb3*f(7)*f(3);
     kb4*f(4)*f(5)-kb5*f(8)*f(11)-kd7*f(7);
    kb5*f(8)*f(11)-kd8*f(9);
    0;
    0;
    0;
  ktx1*f(10)-kd9*f(13);
  ktx2*f(11)-kd10*f(14);
  ktx3*(12)-kd11*f(15)];
   
    %simulating the ODE
    [t,f] = ode15s(odefunc, timespan, init, odesettings);  

    %set output concentration NO
   NO=2;    
     fun_inf=f(end,NO);
     
   %plot(t,f(:,NO));hold on;
   xlabel('Time (s)');
ylabel('Concentration (nM)');
title('Concentration of smURFP over time');
grid on;
grid minor;
  end
  




