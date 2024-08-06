function V2= fun_DDRVS_DPD_Indirect(X1, V1, Y1, Gain_dB, K, T1, T2, M1, M2, DO)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Gain=10^(Gain_dB/20); 
% K=Static_NL_Order; 
% T1=Dy_1st_Order;   M1=Dy_1st_M;
% T2=Dy_2nd_Order; M2=Dy_2nd_M;
if DO==2
    [A1,B1,C1]=fun_DDRVS_2nd_even_LS(Y1/Gain, V1, K, T1, T2, M1, M2);
    V2=fun_DDRVS_2nd_even_cal(X1, A1, B1, C1, T1, T2, M1, M2);
elseif DO==1
   [A2,B2]=fun_DDRVS_1st_even_LS(Y1/Gain, V1, K, T1, M1);
   V2=fun_DDRVS_1st_even_cal(X1, A2, B2, T1, M1);
end
% [A,B,C]=fun_DDRVS_LS(V1, Y1/Gain, K, T1, T2, M1, M2);
% V2=fun_DDRVS_cal(X1, A, B, C, T1, T2, M1, M2);
% %  Pin_V1=fun_Power_cal(V1);
% % Delta_Pin=Pin_X1-Pin_V1;
% % for i=1:10
% % if abs(Delat_Pin)>0.2
end

