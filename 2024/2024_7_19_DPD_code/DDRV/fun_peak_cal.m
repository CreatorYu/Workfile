function Peak_dB = fun_peak_cal(IQ_out1)
%FUN_PEAK_CAL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Z0=50;                                                                      %�����迹ֵ
% Sampling_rate=3.84e6*4;       
Energy=(abs(IQ_out1).^2)/Z0/2;                                           %����֮�ͣ�P=�0�5[(|U|^2)/Z0]��Z0��ʾ�����迹����ʱ�Ĺ��ʷ��Ų���dB������W��
Power=max(Energy);
Peak_dB=10*log10(Power)+30;                                                %�����빦�ʵĵ�λת��ΪdBm��ʽ����10*lg(P/1mW)=10*lg(P)+30;
end

