function [PD_outI, PD_outQ] = Apply_SingleBand_RVTDFNN(in_I, in_Q, modelParam, net)
% net is the trained neural network above code. 
% in_I,in_Q is I/Q data fed into PA.
m = modelParam.TDL;
x = fun_TDL(in_I,in_Q,m);
v = net(x);
PD_outI = v(1,:)';
PD_outQ = v(2,:)';
end

