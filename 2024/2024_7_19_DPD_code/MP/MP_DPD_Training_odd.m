function coefficiency_A = MP_DPD_Training_odd(input,V1,K,Q,G)
%MP_DPD_TRAINING 此处显示有关此函数的摘要
%   此处显示详细说明
Gain=10^(G/20);
coefficiency_A=MP_coefficiency_extract_LS_odd(V1,input,K,Q,Gain);                  %进行参数提取算法
end

