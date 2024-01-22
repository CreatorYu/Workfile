function [net, NMSE, num_of_weights] = Identify_SingleBand_Deep_NN(modelParam, PA_in_I, PA_in_Q, PA_out_I, PA_out_Q, NofDPDPoints)
% net is the trained neural network

% modelParam has the following structure:
m = modelParam.TDL;
trainFcn = modelParam.TrainFcn;
hidensize = modelParam.hidensize;
active1 = modelParam.active1;
active2 = modelParam.active2;

% load training set
x = complex(PA_out_I(1:NofDPDPoints), PA_out_Q(1:NofDPDPoints));
y = complex(PA_in_I(1:NofDPDPoints), PA_in_Q(1:NofDPDPoints));

% normalization
[norm_xI, norm_xQ] = setMeanPower(real(x), imag(x), 0); 
[norm_yI, norm_yQ] = setMeanPower(real(y), imag(y), 0); 

input_I = norm_xI;
input_Q = norm_xQ;
input = fun_TDL(input_I,input_Q,m);

target_I = norm_yI;
target_Q = norm_yQ;
sample_num = length(input_Q);
target = zeros(2,sample_num);
target(1,:) = target_I';
target(2,:) = target_Q';

% build a nn
%net = newff(input,target,NodeNum,{trFunc3,trFunc3,trFunc3,trFunc3,trFunc2},Train_alg);
net = newff(input, target, hidensize, {active1,active1,active1,active1,active1,active1,active1,active1,active2}, trainFcn);  %采用newff函数创建一个5层前向神经网络;
%view(net);
% train the nn
net = train(net,input,target);

% test the nn
output = sim(net,input);
y_est2 = complex(output(1,:)',output(2,:)');
NMSE = 10*log10(mean(((abs(y-y_est2).^2)/mean(abs(y)).^2)))
PlotGain_WithWithout(real(x),imag(x),real(y),imag(y),real(y_est2),imag(y_est2)) ;
PlotAMPM_WithWithout(real(x),imag(x),real(y),imag(y),real(y_est2),imag(y_est2)) ;
num_of_weights = (size(input,1)+1)*hidensize(1)+(1+hidensize(1))*hidensize(2)+(1+hidensize(2))*hidensize(3)+(1+hidensize(3))*hidensize(4)+(1+hidensize(4))*size(target,1)

disp([' *************************  ']); 
disp([' NMSE = ', num2str(NMSE), ' dB' ]);
disp([' *************************  ']);

disp([' *************************  ']); 
disp([' No. of coefficients ', num2str(2*(m+1)*hidensize+hidensize+hidensize*2+2) ]);
disp([' *************************  ']);
end


