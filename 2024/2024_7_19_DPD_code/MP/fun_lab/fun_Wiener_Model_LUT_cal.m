%% 模拟基于查找表的维纳PA模型————先通过一个线性时不变系统，再通过一个静态非线性系统
function Y1=fun_Wiener_Model_LUT_cal(X1, M, A, Plow, Pinm_dB, Num_section, Gstatic, PX)
%X1表示输入信号，M表示记忆深度，A表示LTI系统各项系数，Gstatic表示静态增益
PX1=fun_Power_cal(X1);                                                      %计算输入信号X1的功率（dBm）
if abs(PX1-PX)>5                                                            %判断输入信号X1的功率是否达到期望输出功率
    fprintf('the input power should be around the desired level')           
%    dd
end
for i=1:M+1
    W(:,i)=fun_delay_periodic(X1,i-1);                                      %对输入信号进行延迟处理（LTI），并将X1时延i+1后的一系列信号存入W矩阵中的i列
end
U1=W*A;                                                                     %得到通过LTI系统后的输出U1.
Y1=fun_Memoryless_NonL_LUT(Plow, Pinm_dB, Num_section, Gstatic, U1);        %将LTI系统输出信号U1经过静态非线性系统，得到最终输出信号Y1
end