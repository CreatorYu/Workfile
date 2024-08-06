%% 计算各个信道功率Channel_Power
function ChannelPower=fun_Channel_Power_cal(SampleRate, Channel_Freq, Channel_BW,IQ_in)
% Note: use ACPR tool to calculate  channel power
hACPR=comm.ACPR('SampleRate',SampleRate);                                   %设置对象hACPR；Creates an ACPR measurement object with SampleRate values.NormalizedFrequency设置为0
hACPR.MainChannelFrequency=0;                                               %将ACPR的主通道中心频率（Main channel center frequency）设置为0；
hACPR.MainMeasurementBandwidth=Channel_BW;                                  %此属性指定对象测量主通道功率的带宽。测量在频率的中心进行，由MainChannelFrequency属性指定。
hACPR.AdjacentChannelOffset=Channel_Freq;                                   %相邻通道频率偏移
hACPR.AdjacentMeasurementBandwidth=Channel_BW;                              %每个相邻通道的测量带宽
hACPR.MainChannelPowerOutputPort=true;                                      %选择启用主通道功率测量输出
hACPR.AdjacentChannelPowerOutputPort=true;                                  %选择启用相邻通道功率测量输出
%hACPRoutput=clone(hACPR);
[~, ~, ChannelPower]=step(hACPR,IQ_in);                                     %运行系统对象算法，即计算各个信道功率
% [ACPRo,mainChannelPowero,adjChannelPowero]=step(hACPR,IQ_out1);
release(hACPR);
end









