function NMSE= fun_NMSE_cal(F_mea, F_fit)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
P_mea= fun_Power_cal(F_mea);
P_fit= fun_Power_cal(F_fit);
% 
F_fit1=fun_Power_scale(P_mea, P_fit, F_fit);                                %得到F_fit的归一化功率
t1=mean(abs(F_mea-F_fit1).^2);
t2=mean(abs(F_mea).^2);
NMSE=10*log10(t1/t2);
end

