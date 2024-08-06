function coefficiency_A = MP_DPD_Training_even(input,V1,K,Q,G)
%MP_DPD_TRAINING 此处显示有关此函数的摘要
%   此处显示详细说明
Gain=10^(G/20);                                                                     %这里的G是Y与Z的增益，即电压值增益，以20为底
coefficiency_A=MP_coefficiency_extract_LS_even(V1,input,K,Q,Gain);                  %进行参数提取算法

