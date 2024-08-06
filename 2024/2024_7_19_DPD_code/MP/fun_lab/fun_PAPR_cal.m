function PAPR=fun_PAPR_cal(IQ_in)
%% CCDF Measurements——采样MATLAB中CCDF系统对象算法
% the input IQ_in should be column vector
hCCDF = comm.CCDF('PAPROutputPort',true,'MaximumPowerLimit',100);           %建立一个CCDF对象，相应属性名：PAPROutputPort=1,MaximumPowerLimit（最大期望输入信号功率限制）=100
[~,~, PAPR] = step(hCCDF, IQ_in);                                           %使用hCCDF更新输入IQ_in的CCDF，输出为PAPR。
release(hCCDF);
end