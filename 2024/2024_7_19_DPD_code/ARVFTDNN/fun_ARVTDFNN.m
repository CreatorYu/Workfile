function [V_out,Av_power_diff] = fun_ARVTDFNN(V,X,Y,G,m)
% m表示记忆深度，V表示预失真器输出，X表示预失真器输入，Y表示功放输出，G表示PA的平均功率增益
Gain = 10^(G/20);
Y = Y./Gain;   
NofDPDPoints = length(Y);

% 包含3阶包络项
input = zeros(5*(m+1),NofDPDPoints);
input_I = real(Y);
input_Q = imag(Y);
input_envelope = abs(complex(input_I,input_Q));
input(1:2*(m+1),:) = fun_TDL(input_I,input_Q,m);
input(2*(m+1)+1:4*(m+1),:) = fun_TDL(input_envelope,input_envelope.^2,m);
for i = 1:m+1
    input(4*(m+1)+i,:) = fun_delay(input_envelope.^3,i-1);
end


target_I = real(V);
target_Q = imag(V);
sample_num = length(input_Q);
target = zeros(2,sample_num);
target(1,:) = target_I';
target(2,:) = target_Q';
% 神经网络的输入与输出都为行向量
 
% 创建神经网络
%hidensize = 20;            %浅层网络
hidensize = [5,10,5,10];      %深层网络，5层（包含输出层）
trainFcn = 'trainlm';      %采用LM算法作为反向传播算法
%active3 = 'poslin';
active4 = 'elu';
% net = feedforwardnet(hidensize,trainFcn);  %采用feedforwardnet函数创建一个2层前向神经网络;
net = newff(input, target, hidensize, {active4}, trainFcn);  %采用newff函数创建一个前向神经网络;
net = configure(net,input,target);     %传输训练数据，每一列应代表着不同的样本
%view(net);
 
% 训练网络
net = train(net,input,target);

% 运用网络
x_envelope = abs(complex(real(X),imag(X)));
x = zeros(5*(m+1),NofDPDPoints);
x(1:2*(m+1),:) = fun_TDL(real(X),imag(X),m);
x(2*(m+1)+1:4*(m+1),:) = fun_TDL(x_envelope,x_envelope.^2,m);
for i = 1:m+1
    x(4*(m+1)+i,:) = fun_delay(x_envelope.^3,i-1);
end
output = sim(net,x);
V_out = output(1,:)'+1i*output(2,:)';
P_vout = fun_Power_cal(V_out);
Pin = fun_Power_cal(X);
Av_power_diff = P_vout-Pin;
%fprintf("Av_Power_diff=%f\n",Av_Power_diff);
end

