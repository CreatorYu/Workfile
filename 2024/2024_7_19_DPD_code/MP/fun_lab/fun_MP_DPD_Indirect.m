function V2 = fun_MP_DPD_Indirect(X1, V1, Y1, Gain_dB, K, Q)
Gain=10^(Gain_dB/20);
A1=fun_MP_coefficiency(Y1/Gain, V1, K, Q);
V2=fun_MP_DPD_cal(X1,A1,K,Q);
end

