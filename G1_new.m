timespan = [0 1800];  %Time span 
init = [0 0 0 0 0.22e9 0 1 1 1];  %Initial values of the functions       

%ODE settings
odesettings = odeset('AbsTol', 1e-12, 'RelTol', 1e-6);

%simulating the ODE
[t,f] = ode15s(@odefunc, timespan, init, odesettings);

%Graphs
a=f(:,2);
% b=[t,a];

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
%     cplx_3 = f(4);
%       sgRNA = f(5);
   cplx_2 = f(4);
    cplx_4= f(5);
    cplx_5 = f(6);
    P_J23104=f(7);
%     P_tet=f(10);
    P_arsR=f(8);
    As=f(9);
    %parameters
       k1= 1.099e-3 ;
		k2 = 2.76e-3 ;
		k3 = 1e4   ;
	%	k4 =1.099e-3 ;
	%	k5 = 2.76e-3;
		k6 =1e3 ;
		k7 =1.26e4;
	%	k8=1.6e-2;
		k9 =1.66e-5;
		k10=4e-5;
		kd1 = 3.07e-3;
		kd2=1e-5;
		kd3=1e-3 ;
		kd4=1.53e-3;
	%	kd5 = 2e-2;
	%	kd6=7.62e-3;
        kd7=1e-2;
        kd8=1e-1;
 %ODEs
    dfdt = zeros(9,1);
    dfdt(1) = k1*P_J23104-kd1*P_arsR*ArsR;
    dfdt(2) = k2*P_arsR+k10*cplx_5-kd2*smURFP;
    dfdt(3) = k3*ArsR*P_arsR-k7*As*cplx_1-kd3*cplx_1;
   % dfdt(4) = k4*P_tet-k8*cplx_3*sgRNA-kd5*cplx_3;
  %  dfdt(5) = k5*P_tet-k8*cplx_3*sgRNA-kd6*sgRNA;
    dfdt(4) =k6*As*ArsR+k7*As*cplx_1-kd4*cplx_2;
    dfdt(5) =-k9*cplx_4*P_arsR-kd7*cplx_4;
    dfdt(6) =k9*cplx_4*P_arsR-kd8*cplx_5;
    dfdt(7)=0;
   % dfdt(10)=0;
    dfdt(8)=0;
    dfdt(9)=-k6*As*ArsR-k7*As*cplx_1;
  end
  
  