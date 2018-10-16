%without crispr
timespan = [0 1800000];  %Time span 
init = [0 0 0 0 1 1 1 0 0];  %Initial values of the functions       

%ODE settings
odesettings = odeset('AbsTol', 1e-12, 'RelTol', 1e-6);

%simulating the ODE
[t,f] = ode15s(@odefunc, timespan, init, odesettings);

%Graphs
a=f(:,2);
figure;
plot(t,a);
xlabel('Time (s)');
ylabel('Concentration (nM)');
title('Concentration of smURFP over time');
grid on;
grid minor;

  function dfdt = odefunc(t,f)      
     %Functions
    ArsR = f(1);
   smURFP = f(2);
    cplx_1= f(3);
   cplx_2 = f(4);
   As=f(5);
    P_J12304=f(6);
    P_arsR=f(7);
   mRNA_ArsR=f(8);
   mRNA_smURFP=f(9);
   
    %parameters
       ktx1= 1.5e-2;
		ktl1 = 7.33e-2;
		ktx2 = 1.5e-2  ;
		ktl2 =1.84e-13 ;
		kb1 = 1e4;
       kb2=1e3;
		kb3 =1.26e4;
		kd1 = 3.07e-3;
		kd2=1e-5;
		kd3=1e-3 ;
		kd4=1.53e-3;
        kd9=2.81e-3;
        kd10=7.62e-3;
        
 %ODEs
    dfdt = zeros(9,1);
    dfdt(1) = ktl1*mRNA_ArsR-kd1*ArsR;
    dfdt(2) = ktl2*mRNA_smURFP-kd2*smURFP;
    dfdt(3) = kb1*ArsR*P_arsR-kb3*As*cplx_1-kd3*cplx_1;
    dfdt(4) =kb2*As*ArsR+kb3*As*cplx_1-kd4*cplx_2;
    dfdt(5)=-kb2*As*ArsR-kb3*As*cplx_1;
    dfdt(6)=0;
    dfdt(7)=0;
    dfdt(8)=ktx1*P_J12304-kd9*mRNA_ArsR;
    dfdt(9)=ktx2*P_arsR-kd10*mRNA_smURFP;
   
  end
  