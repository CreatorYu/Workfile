clc
clear;
path('C:\Users\16932\Desktop\DPD_code\MP\data',path);
path('C:\Users\16932\Desktop\DPD_code\MP\fun_lab',path);

%% （1）加载初始数据
%% data2
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

%% data 1 
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
Pin_Xt= fun_Power_cal(Xt1)-2;                                                 %利用功率计算函数，计算出X1的功率，即输入信号功率（dBm）

P_IQload= fun_Power_cal(IQ_start);                                          %计算已调信号IQ_start的功率（dBm）
X1=fun_Power_scale(Pin_Xt,P_IQload,IQ_start);                               %上述代码中将'IQ2'放缩了约0.070794578倍。这意味着输出信号X1的振幅将约为输入信号IQ_start的7.07%

%% （2）加载Wiener功放模型参数 
load("C:\Users\16932\Desktop\DPD_code\MP\data\Wiener_Model_30dBm.mat",'M', 'A', 'Plow', 'Pinm_dB', 'Num_section', 'Gstatic', 'PX');

%% （3）将初始信号X1通过PA得到初始输出信号Y1
Y1=fun_Wiener_Model_LUT_cal(X1, M, A, Plow, Pinm_dB, Num_section, Gstatic, PX);

%% （4）计算初始信号的功率及其增益G
Pin_average=fun_Power_cal(X1);
Pout_average=fun_Power_cal(Y1);
G1=Pout_average-Pin_average; 
G2=G1;





%% （5）基于memorypolynomial的DPD设计——不包含偶阶项
K=13;Q=3;                                                                   %K表示记忆多项式阶数，Q表示记忆深度
for i=1:10                                                                   %DPD迭代次数
    fprintf("\nIteration 次数 %d\n",i);
    if i==1                                                                 %表示初始状态，PD没有进行预失真处理。
        V(:,1)=X1;
        Pin_V(i)=fun_Power_cal(V(:,1));
        fprintf("初始化\n\n");
        Av_Power_diff(1)=0;
    else
        [V(:,i),Av_Power_diff(i)]=MP_DPD_Debug_even(V(:,i-1),X1,Y(:,i-1),K,Q,G1(i-1));       %DPD算法——G1由PA输出Y与PA输入V求得
        %G1是PA增益值。
        Pin_V(i)=fun_Power_cal(V(:,i));
         fprintf("\n");
    end
     Y(:,i)=fun_Wiener_Model_LUT_cal(V(:,i), M, A, Plow, Pinm_dB, Num_section, Gstatic, PX);    %PA模型
     [ACLR_out(i,:),PAPR_out(i),ChannelPower_out(i,:)]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,Y(:,i));
     Pout_average=fun_Power_cal(Y(:,i));
     P_V_average=fun_Power_cal(V(:,i));
     G1(i) = Pout_average-P_V_average;                                      %计算PA增益
     G2(i) = Pout_average-Pin_average;                                      %计算带有DPD的PA系统的整体增益
     NMSE(i)=fun_NMSE_cal(X1,Y(:,i));                                       %计算NMSE
     if NMSE(i) < -43
         if abs(Av_Power_diff(i)) < 0.3                                     %X与V的平均功率差小于0.3dB时算法才可收敛
             break;
         end
     end
end

[~,index_best]=min(NMSE);
[ACLR_in,PAPR_in,ChannelPower_in]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,X1);

%% （6）计算AM/AM、AM/PM计算
fprintf("\n\nPA增益值");
G1
fprintf("实际增益值");
G2
NMSE
Pin_V


for i = 1:index_best
    [PindB, AM(:,i), PM(:,i)]=fun_AM_PM_cal(X1, Y(:,i));
end

%% plot figure
AM_best=AM(:,index_best);
PM_best=PM(:,index_best);
figure(1);
plot(PindB,AM(:,1),'r.');
hold on;
plot(PindB,AM_best,'b.');
% hold on;
% plot(PindB,AM3,'g.');
% hold on;
% plot(PindB,AM4,'k.');
h=legend('without DPD','after MP DPD');                             
set(h,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Gain (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
axis([-20 0 13 28]); set(gcf,'color','w');
grid on
hold off

figure(2)
plot(PindB,PM(:,1),'r.');
hold on; 
plot(PindB,PM_best,'b.');
% hold on;
% plot(PindB,PM3,'g.');
% hold on;
% plot(PindB,PM4,'k.');
n=legend('without DPD','after MP DPD');     
set(n,'fontsize',14,'fontname','Times New Roman');
set(gcf,'color','w');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Phase (degree)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
set(gcf,'color','w');
axis([-25 0 -40 40]);
grid on
hold off

clc;
path("E:\matlab\bin\CODE\mycode\fun_lab",path);
path("E:\matlab\bin\CODE\DPD_Research",path);


spectrum(X1, Y, 3, Samplerate,Center_F,index_best);                         %输出有无DPD情况下的PSD图
fun_myplot_spectrum(X1, Y, 4, Samplerate,Center_F);                         %展示DPD运行过程中PSD的变换

fun_myplot_ACLR(ACLR_in,ACLR_out, 5);
fun_myplot_NMSE(NMSE, 6);
fun_myplot_PAPR(PAPR_in, PAPR_out, 7);