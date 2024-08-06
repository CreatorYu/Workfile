function [PD_outI, PD_outQ] = Apply_SingleBand_Deep_NN(in_I, in_Q, modelParam, net)
%APPLY_SINGLEBAND_DEEP_NN 此处显示有关此函数的摘要
%   此处显示详细说明
% net is the trained neural network above code. 
% in_I,in_Q is I/Q data fed into PA.
m = modelParam.TDL;
x = fun_TDL(in_I,in_Q,m);
v = sim(net,x);
PD_outI = v(1,:)';
PD_outQ = v(2,:)';
end

