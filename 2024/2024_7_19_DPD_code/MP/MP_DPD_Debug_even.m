function [V_out,Av_Power_diff] = MP_DPD_Debug_even(V1,X1,Y,K,Q,G1)
%此模块为基于记忆多项式模型的DPD模块，记忆多项式的阶数与记忆深度分别为K、Q
%G1是PA平均功率增益值（数值）。
coefficiency_A=MP_DPD_Training_even(Y,V1,K,Q,G1);
V_mid = MP_DPD_MODEL_even(Y/G1,coefficiency_A,K,Q);
NMSE_V = fun_NMSE_cal(V1,V_mid);
fprintf("NMSE_V=%f\n",NMSE_V);
V_out = MP_DPD_MODEL_even(X1,coefficiency_A,K,Q);
P_Vout_average=fun_Power_cal(V_out);  
P_X1 = fun_Power_cal(X1);
Av_Power_diff = P_X1-P_Vout_average;
fprintf("Av_Power_diff=%f\n",Av_Power_diff);
end
