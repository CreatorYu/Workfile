function [V_out,Av_Power_diff] = MP_DPD_Debug_odd(V1,X1,Y,K,Q,G1)
%此模块为基于记忆多项式模型的DPD模块，记忆多项式的阶数与记忆深度分别为K、Q
%G1是PA平均功率增益值（数值）。
coefficiency_A=MP_DPD_Training_odd(Y,V1,K,Q,G1);                            %提取预失真器模型系数bk
V_out = MP_DPD_MODEL_odd(X1,coefficiency_A,K,Q);                            %计算此次迭代的预失真器PD的输出信号
P_X1 = fun_Power_cal(X1);
P_Vout_average=fun_Power_cal(V_out);  
Av_Power_diff = P_X1-P_Vout_average;                                        %计算预失真器PD输入与输出信号的平均功率差值
fprintf("Av_Power_diff=%f\n",Av_Power_diff);
end

