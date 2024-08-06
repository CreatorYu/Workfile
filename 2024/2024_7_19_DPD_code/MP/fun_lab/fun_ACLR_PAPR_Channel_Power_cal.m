%% 计算PA模型输出信号Y1的部分指标
function [ACLR,PAPR,ChannelPower]= fun_ACLR_PAPR_Channel_Power_cal(SampleRate, Channel_Freq, Channel_BW,IQ_ins)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ChannelPower_U=fun_Channel_Power_cal(SampleRate, Channel_Freq, Channel_BW,IQ_ins);%计算信道功率Channel_Power
ChannelPower=ChannelPower_U-20;                                             %
% P_main=ChannelPower_IN(2); 
ACLR= fun_ACLR_cal(ChannelPower);                                           %计算待测信号的ACLR-邻道泄露比
PAPR=fun_PAPR_cal(IQ_ins);                                                  %计算待测信号峰值平均功率比
end

