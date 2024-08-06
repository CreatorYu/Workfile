%% 进行归一化处理
% 将一个复数矩阵IQ2的每列按照给定的分贝差值（dB_diff）进行功率缩放，并将结果存储在IQ1中
%
function IQ1=fun_Power_scale(P1,P2,IQ2)
%
dB_diff=P1-P2;
N=length(dB_diff);
for i=1:N
IQ1(:,i)=IQ2(:,i)*10^(dB_diff(i)/20);                                       %IQ1(:,i)就表示A的第i列的所有元素；
end
end