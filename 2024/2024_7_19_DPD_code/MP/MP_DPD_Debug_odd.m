function [V_out,Av_Power_diff] = MP_DPD_Debug_odd(V1,X1,Y,K,Q,G1)
%��ģ��Ϊ���ڼ������ʽģ�͵�DPDģ�飬�������ʽ�Ľ����������ȷֱ�ΪK��Q
%G1��PAƽ����������ֵ����ֵ����
coefficiency_A=MP_DPD_Training_odd(Y,V1,K,Q,G1);                            %��ȡԤʧ����ģ��ϵ��bk
V_out = MP_DPD_MODEL_odd(X1,coefficiency_A,K,Q);                            %����˴ε�����Ԥʧ����PD������ź�
P_X1 = fun_Power_cal(X1);
P_Vout_average=fun_Power_cal(V_out);  
Av_Power_diff = P_X1-P_Vout_average;                                        %����Ԥʧ����PD����������źŵ�ƽ�����ʲ�ֵ
fprintf("Av_Power_diff=%f\n",Av_Power_diff);
end

