function [V2, Gain_dBf]= fun_DDRVS_DPD_Gain_Adjust(X1,V1,Y1, Gain_dB, K, T1, T2, M1, M2, DO)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% NL_order=5; Memory_Length=5; % Gain=1;
%
cp=0;
Pin_X1=fun_Power_cal(X1);
for i=1:10
     Vt2(:,i)= fun_DDRVS_DPD_Indirect(X1,V1,Y1, Gain_dB(i), K, T1, T2, M1, M2, DO);
     Pin_Vt2(i)=fun_Power_cal(Vt2(:,i));
     Delta_Pin(i)=Pin_Vt2(i)-Pin_X1;
     if abs(Delta_Pin(i))>0.2
         Gain_dB(i+1)=Gain_dB(i)-Delta_Pin(i);
%          Gain(i+1)=10^((Gain_dB(i+1))/20); 
     else
         break;
     end
     if i==10
         fprintf('the iteration procedure is not convergent');
         save('Error_State.mat');
         cp=1;
     end
end
% Iter_times=i-1;
if cp==1
   Gain_dBf=0;  V2=X1;
else Gain_dBf=Gain_dB(end); V2=Vt2(:,end);
end
save('Internal_State.mat');
end

