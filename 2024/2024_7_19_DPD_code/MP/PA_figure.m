%% input signal
clc;
clear;
path('E:\matlab\bin\CODE\mycode\data',path);
path('E:\matlab\bin\CODE\mycode\fun_lab',path);

Center_F=2.5*1e6;
Channel_F=[-5.3 0 5.3]*1e6;
Bandwidth=5e6;
Samplerate=30.72e6;                                                         %采样频率设置为30.72MHz

j = sqrt(-1);
I1 = importdata('LTE_5MHz_In_I_30_72r0_PAPR_9r0_0_5ms.txt');                %加载同相输入信号I1
Q1 = importdata('LTE_5MHz_In_Q_30_72r0_PAPR_9r0_0_5ms.txt');                %加载正交输入信号Q1
IQ_sample=I1+j*Q1;                                                          %得到正交调制信号IQ_Sample=I1+j*Q1
N_sample=length(IQ_sample);                                                 %获取已调信号的长度
IQ_start=IQ_sample(1:N_sample);                                             %将已调信号注入到变量IQ_start中

t1=load('DPD_Mea_Indirect_Learning_Phase_cal_20.mat','X1');                 %加载文件.mat 中的变量X1；并将其加载到结构体(struct)数组t1当中
Xt1=t1.X1;                                                                  %调用结构体数组（单元）ti中的数据X1
Pin_Xt= fun_Power_cal(Xt1);                                                 %利用功率计算函数，计算出X1的功率，即输入信号功率（dBm）

P_IQload= fun_Power_cal(IQ_start);                                          %计算已调信号IQ_start的功率（dBm）
X1=fun_Power_scale(Pin_Xt,P_IQload,IQ_start);                               %对正交调制后的信号IQ_start进行归一化处理？得到已调信号功率X1（W）

%% load Wiener model PA
load("E:\matlab\bin\CODE\mycode\data\Wiener_Model_30dBm.mat",'M', 'A', 'Plow', 'Pinm_dB', 'Num_section', 'Gstatic', 'PX');
Y1=fun_Wiener_Model_LUT_cal(X1, M, A, Plow, Pinm_dB, Num_section, Gstatic, PX);

%% compute Pin,Pout,G
Pin=fun_Power_cal(X1);                                                %计算输入功率（dBm）
Pout=fun_Power_cal(Y1);
G=Pout-Pin;

P_peak=max(Pout);
%% Plot G-versus-Pin and Pout-versuss-Pin 
figure(1);
plot(Pin,Pout,'r.');
hold on;
plot(Pin,G,'b.');
hold on;
axis([-15 23 0 43]);
legend("Pout-Pin","G-Pin");
xlabel("Pin(dBm)",'fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel("Pout(dBm)/G(dB)",'fontsize',15,'fontname','Times New Roman','fontweight','b');
grid on;