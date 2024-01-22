function [PD_outI, PD_outQ] = Apply_SingleBand_ARVTDFNN(in_I, in_Q, modelParam, net)
% net is the trained neural network above code. 
% in_I,in_Q is I/Q data fed into PA.
x_envelope = abs(complex(in_I,in_Q));
m = modelParam.TDL;
x = zeros(5*(m+1),length(in_I));
x(1:2*(m+1),:) = fun_TDL(in_I,in_Q,m);
x(2*(m+1)+1:4*(m+1),:) = fun_TDL(x_envelope,x_envelope.^2,m);
for i = 1:m+1
    x(4*(m+1)+i,:) = fun_delay(x_envelope.^3,i-1);
end

v = sim(net,x);
PD_outI = v(1,:)';
PD_outQ = v(2,:)';
end


