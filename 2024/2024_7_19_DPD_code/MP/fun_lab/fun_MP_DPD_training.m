function [V2, Gain_dBf] = fun_MP_DPD_training(X1,V1,Y1, Gain_dB, K, Q)
%FUN_MP_DPD_GAIN_ADJUST �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
cp=0;
Pin_X1=fun_Power_cal(X1);                                                   %����X1��ƽ������
for i=1:10
     Vt2(:,i)= fun_MP_DPD_Indirect(X1,V1,Y1,Gain_dB(i), K, Q);
     Pin_Vt2(i)=fun_Power_cal(Vt2(:,i));                                    %����Ԥʧ������i������źŵ�ƽ������
     Delta_Pin(i)=Pin_Vt2(i)-Pin_X1;                                        %�����i�ε�����Ԥʧ����ģ������źŵ�ƽ�������������ź�X1ƽ�����ʵĲ�ֵdB
     if abs(Delta_Pin(i))>0.2                                               %���й����������
         Gain_dB(i+1)=Gain_dB(i)-Delta_Pin(i);
     else break                                                             %���X1��ѵ��ģ������ź����ƴﵽһ���̶ȣ����㷨����
     end
     if i==10                                                               %���㷨������10����δ�жϣ���ǿ����ֹ
         fprintf('the iteration procedure is not convergent');
         save('Error_State.mat');                                           %�洢��������
         cp=1;
     end
end
if cp==1                                                                    %cp=1˵���㷨δ����
   Gain_dBf=0;  V2=X1;                                                      %DPDԤʧ����δ������
else Gain_dBf=Gain_dB(end); V2=Vt2(:,end);                                  %��cp=0��˵���㷨��������������յ�DPD����������Ԥʧ���ź�V2
end
save('Internal_State.mat');
end

