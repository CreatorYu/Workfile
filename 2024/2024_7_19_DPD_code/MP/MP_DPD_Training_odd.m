function coefficiency_A = MP_DPD_Training_odd(input,V1,K,Q,G)
%MP_DPD_TRAINING �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Gain=10^(G/20);
coefficiency_A=MP_coefficiency_extract_LS_odd(V1,input,K,Q,Gain);                  %���в�����ȡ�㷨
end

