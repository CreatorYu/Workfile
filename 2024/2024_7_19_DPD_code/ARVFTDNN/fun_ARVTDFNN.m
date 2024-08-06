function [V_out,Av_power_diff] = fun_ARVTDFNN(V,X,Y,G,m)
% m��ʾ������ȣ�V��ʾԤʧ���������X��ʾԤʧ�������룬Y��ʾ���������G��ʾPA��ƽ����������
Gain = 10^(G/20);
Y = Y./Gain;   
NofDPDPoints = length(Y);

% ����3�װ�����
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
% ������������������Ϊ������
 
% ����������
%hidensize = 20;            %ǳ������
hidensize = [5,10,5,10];      %������磬5�㣨��������㣩
trainFcn = 'trainlm';      %����LM�㷨��Ϊ���򴫲��㷨
%active3 = 'poslin';
active4 = 'elu';
% net = feedforwardnet(hidensize,trainFcn);  %����feedforwardnet��������һ��2��ǰ��������;
net = newff(input, target, hidensize, {active4}, trainFcn);  %����newff��������һ��ǰ��������;
net = configure(net,input,target);     %����ѵ�����ݣ�ÿһ��Ӧ�����Ų�ͬ������
%view(net);
 
% ѵ������
net = train(net,input,target);

% ��������
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

