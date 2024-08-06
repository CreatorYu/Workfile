%% 计算相邻信道功率
function ACLR= fun_ACLR_cal(ChannelPower)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N=length(ChannelPower);
if N==3                                                                     %3载波信号
Pin=ChannelPower(2);                                                        %主信道功率
Adj1=ChannelPower(1); Adj2=ChannelPower(3);                                 %相邻信道功率
ACLR(1)=Adj1-Pin;                                                           %下边带ACLR = Power in adjcent
ACLR(2)=Adj2-Pin;                                                           %上边带ACLR
elseif N==5
    Pin=ChannelPower(3); 
   Adj_5_1=ChannelPower(2); Adj_5_2=ChannelPower(4);
   Adj_10_1=ChannelPower(1); Adj_10_2=ChannelPower(5);
   ACLR(1)=Adj_10_1-Pin; ACLR(2)=Adj_5_1-Pin;  ACLR(3)=Adj_5_2-Pin; ACLR(4)=Adj_10_2-Pin;
end

