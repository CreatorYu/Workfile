function coefficiency_A = MP_DPD_Training_even(input,V1,K,Q,G)
%MP_DPD_TRAINING �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Gain=10^(G/20);                                                                     %�����G��Y��Z�����棬����ѹֵ���棬��20Ϊ��
coefficiency_A=MP_coefficiency_extract_LS_even(V1,input,K,Q,Gain);                  %���в�����ȡ�㷨

