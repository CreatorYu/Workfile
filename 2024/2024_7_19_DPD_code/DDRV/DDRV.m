function [V_out,Av_Power_diff] = DDRV(V,X,Y,K,Q,G,order)
%   此处显示详细说明
A = DDRV_DPD_LS(V,Y,K,Q,G,order);
V_out = DDRV_DPD_MODEL(X,K,Q,A,order);
P_vout = fun_Power_cal(V_out);
Pin = fun_Power_cal(X);
Av_Power_diff = P_vout-Pin;
fprintf("Av_Power_diff=%f\n",Av_Power_diff);
end

