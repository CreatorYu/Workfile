%% 计算信号的功率（dBm）
function Power_dBm= fun_meanpower_cal(IQ_out1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
j=sqrt(-1);                                                                 
% Sampling_rate=3.84e6*4;
Power = abs(IQ_out1);
Power = Power.^2 ;
meanPower = mean(Power);
Power_dBm = 10*log10(meanPower/100)+30 ;
end