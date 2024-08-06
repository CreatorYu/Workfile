function Peak_dB = fun_peak_cal(IQ_out1)
%FUN_PEAK_CAL 此处显示有关此函数的摘要
%   此处显示详细说明
Z0=50;                                                                      %输入阻抗值
% Sampling_rate=3.84e6*4;       
Energy=(abs(IQ_out1).^2)/Z0/2;                                           %求功率之和：P=½[(|U|^2)/Z0]，Z0表示输入阻抗。此时的功率符号不是dB，而是W。
Power=max(Energy);
Peak_dB=10*log10(Power)+30;                                                %将输入功率的单位转换为dBm形式——10*lg(P/1mW)=10*lg(P)+30;
end

