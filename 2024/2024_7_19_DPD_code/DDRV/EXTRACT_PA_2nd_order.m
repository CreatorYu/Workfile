clc
clear;
path('E:\matlab\bin\CODE\mycode\data',path);
path('E:\matlab\bin\CODE\mycode\fun_lab',path);


%% Load Date 1
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
Pin_Xt= fun_Power_cal(Xt1)-2;                                                 %Xt的功率是X1的平均功率！！！！！！！！

P_IQload= fun_Power_cal(IQ_start);                                          %计算已调信号IQ_start的功率（dBm）
X1=fun_Power_scale(Pin_Xt,P_IQload,IQ_start);                               %将IQ_start放缩到abs(Xt1)/abs(IQ_start)倍

%% Load Data 2
% Center_F=2e9;
% Channel_F=[-5 0 5]*1e6;
% Bandwidth=3.84e6;
% Samplerate=30.72e6;                                                         %采样频率设置为30.72MHz
% 
% j=sqrt(-1);
% load('Xin_6_6dB_F7.mat');
% load('Xin_8_6dB_F7.mat');
% XF7=Xin_8_6dB_F7;
% IQ_start=[XF7(1:8960); XF7(1)];
% P_vsg=-36; 
% Gain_Drive=46.8;
% 
% Pin_X1=P_vsg+Gain_Drive-2;
% P_IQload= fun_Power_cal(IQ_start);
% X1=fun_Power_scale(Pin_X1,P_IQload,IQ_start);

%% instant PA
load("E:\matlab\bin\CODE\mycode\data\Wiener_Model_30dBm.mat",'M', 'A', 'Plow', 'Pinm_dB', 'Num_section', 'Gstatic', 'PX');
Y1=fun_Wiener_Model_LUT_cal(X1, M, A, Plow, Pinm_dB, Num_section, Gstatic, PX);
Pin = fun_Power_cal(X1);Pout = fun_Power_cal(Y1);
G = Pout-Pin;
Gain = 10^(G/20);
%% DDRV based PA model_2nd_order
K=5;Q=3;
N_y = length(Y1);
N_x1 = ((K-1)/2+1)*(Q+1);
N_x2 = Q*((K-1)/2);
U1 = zeros(N_y,N_x1);
for k = 1:(K-1)/2+1
    for m = 1:Q+1
        U1(:,(k-1)*(Q+1)+m)=((abs(X1)).^(2*(k-1))).*fun_delay(X1,m-1);
    end
end
U2 = zeros(N_y,N_x2);
U3 = zeros(N_y,N_x2);
U4 = zeros(N_y,N_x2);
for k =1:(K-1)/2
    for m = 1:Q
        U2(:,m+(k-1)*Q)=((abs(X1)).^(2*(k-1))).*((X1).^2).*conj(fun_delay(X1,m));
        U3(:,m+(k-1)*Q)=((abs(X1)).^(2*(k-1))).*(X1).*(abs(fun_delay(X1,m))).^2;
        U4(:,m+(k-1)*Q)=((abs(X1)).^(2*(k-1))).*conj(X1).*(fun_delay(X1,m)).^2;
    end
end
U = [U1 U2 U3 U4];
coefficiency = U\Y1;
Y2 = U*coefficiency;
Y=[Y1,Y2];

NMSE=fun_NMSE_cal(Y1,Y2);
fprintf("NMSE of Original and DDRV:\n");
disp(NMSE);

for i =1:2
    [PindB, AM(:,i), PM(:,i)]=fun_AM_PM_cal(X1, Y(:,i));
end
for i = 1:2
    [~,PoutdB(:,i),~]=AM_PM_cal(X1,Y(:,i));
end
figure(3);
plot(PindB,PoutdB(:,1),'.r');
hold on;
plot(PindB,PoutdB(:,2),'.b');
hold off;
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Normalized out Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
h=legend('Original AM-AM',"DDVR AM-AM");
set(h,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
axis([-23 0 -25 0]);
grid on;
figure(1);
plot(PindB,AM(:,1),'r.');
hold on;
plot(PindB,AM(:,2),'b.');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Gain (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
n=legend("Wiener based PA","DDRV PA");
set(n,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
axis([-20 0 13 28]); set(gcf,'color','w');
grid on
hold off;
figure(2);
plot(PindB,PM(:,1),'r.');
hold on;
plot(PindB,PM(:,2),'b.');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Phase(degree)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
n=legend("Wiener based PA","DDRV PA");
set(n,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
axis([-25 0 -20 20]); set(gcf,'color','w');
grid on
hold off;
Spectrum1(X1,Y,4,Samplerate,Center_F,2);