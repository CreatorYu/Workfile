function [V2, Gain_dBf] = fun_MP_DPD_training(X1,V1,Y1, Gain_dB, K, Q)
%FUN_MP_DPD_GAIN_ADJUST 此处显示有关此函数的摘要
%   此处显示详细说明
cp=0;
Pin_X1=fun_Power_cal(X1);                                                   %计算X1的平均功率
for i=1:10
     Vt2(:,i)= fun_MP_DPD_Indirect(X1,V1,Y1,Gain_dB(i), K, Q);
     Pin_Vt2(i)=fun_Power_cal(Vt2(:,i));                                    %计算预失真器第i次输出信号的平均功率
     Delta_Pin(i)=Pin_Vt2(i)-Pin_X1;                                        %计算第i次迭代后，预失真器模型输出信号的平均功率与输入信号X1平均功率的差值dB
     if abs(Delta_Pin(i))>0.2                                               %进行功率增益调制
         Gain_dB(i+1)=Gain_dB(i)-Delta_Pin(i);
     else break                                                             %如果X1与训练模块输出信号相似达到一定程度，则算法收敛
     end
     if i==10                                                               %若算法迭代了10次仍未中断，则强行终止
         fprintf('the iteration procedure is not convergent');
         save('Error_State.mat');                                           %存储错误数据
         cp=1;
     end
end
if cp==1                                                                    %cp=1说明算法未收敛
   Gain_dBf=0;  V2=X1;                                                      %DPD预失真器未起作用
else Gain_dBf=Gain_dB(end); V2=Vt2(:,end);                                  %若cp=0，说明算法收敛，并输出最终的DPD调整增益与预失真信号V2
end
save('Internal_State.mat');
end

