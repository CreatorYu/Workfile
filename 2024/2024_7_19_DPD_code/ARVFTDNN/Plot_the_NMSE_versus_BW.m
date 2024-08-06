close all;
clear;
clc;
path("D:\Matlab\Xiaohu_Fang\SingleCarrier_DPD_Automation_v1_140411\usefull functions",path);

BW = [80e6, 100e6, 120e6, 140e6, 160e6, 180e6, 200e6];
Fs = 5.*BW;
NMSE_withoutDPD = zeros(1,7);
NMSE_withDDRDPD = zeros(1,7);
NMSE_withRVTDFNNDPD = zeros(1,7);
NMSE_withARVTD_DNNDPD = zeros(1,7);
%% load data Without DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0);
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withoutDPD(1) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withoutDPD; Out_Q_withoutDPD]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD,Fs(2),2000) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withoutDPD(2) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_withoutDPD;Out_Q_withoutDPD]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD,Fs(3),2000) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withoutDPD(3) = fun_nmse([In_I_origin, In_Q_origin],[Out_I_withoutDPD, Out_Q_withoutDPD]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD,Fs(4),2000) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withoutDPD(4) = fun_nmse([In_I_origin, In_Q_origin],[Out_I_withoutDPD, Out_Q_withoutDPD]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD,Fs(5),2000) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withoutDPD(5) = fun_nmse([In_I_origin, In_Q_origin],[Out_I_withoutDPD, Out_Q_withoutDPD]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withoutDPD(6) = fun_nmse([In_I_origin, In_Q_origin],[Out_I_withoutDPD, Out_Q_withoutDPD]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withoutDPD(7) = fun_nmse([In_I_origin, In_Q_origin],[Out_I_withoutDPD, Out_Q_withoutDPD]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% load data With DDR-DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\DDR-Measurement03-Jan-2024_17_25_50\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(1) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(2),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(2) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\DDR_Measurement04-Jan-2024_18_25_14\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(3),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(3) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\DDR-Measurement05-Jan-2024_15_29_48\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(4),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(4) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\DDR-Measurement04-Jan-2024_18_56_5\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(5),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(5) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\DDR-Measurement04-Jan-2024_19_4_53\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(6) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\DDR-Measurement05-Jan-2024_15_5_56\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(7) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% load data Without ARVTD-DNN-DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\ARVTD-DNN-Measurement03-Jan-2024_17_14_32\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\ARVTD-DNN-Measurement03-Jan-2024_17_14_32\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\ARVTD-DNN-Measurement03-Jan-2024_17_14_32\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\ARVTD-DNN-Measurement03-Jan-2024_17_14_32\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(1) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(2),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(2) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\ARVTD-DNN-Measurement04-Jan-2024_18_34_28\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\ARVTD-DNN-Measurement04-Jan-2024_18_34_28\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\ARVTD-DNN-Measurement04-Jan-2024_18_34_28\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\ARVTD-DNN-Measurement04-Jan-2024_18_34_28\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(3),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(3) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_35_31\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_35_31\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_35_31\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_35_31\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(4),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(4) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_18_59_52\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_18_59_52\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_18_59_52\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_18_59_52\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(5),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(5) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_21_54_25\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_21_54_25\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_21_54_25\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\ARVTD-DNN-Measurement04-Jan-2024_21_54_25\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(6) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_24_4\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_24_4\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_24_4\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\ARVTD-DNN-Measurement05-Jan-2024_15_24_4\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(7) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% load data With RVTDFNN-DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\RVTDFNN-Measurement03-Jan-2024_17_20_9\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\RVTDFNN-Measurement03-Jan-2024_17_20_9\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\RVTDFNN-Measurement03-Jan-2024_17_20_9\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_3\RVTDFNN-Measurement03-Jan-2024_17_20_9\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(1) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(2),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(2) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\RVTDFNN-Measurement04-Jan-2024_18_28_33\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\RVTDFNN-Measurement04-Jan-2024_18_28_33\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\RVTDFNN-Measurement04-Jan-2024_18_28_33\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_9\RVTDFNN-Measurement04-Jan-2024_18_28_33\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(3),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(3) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_31_42\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_31_42\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_31_42\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_31_42\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(4),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(4) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_18_51_14\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_18_51_14\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_18_51_14\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_18_51_14\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(5),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(5) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_19_8_18\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_19_8_18\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_19_8_18\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr9_1\RVTDFNN-Measurement04-Jan-2024_19_8_18\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(6) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_8_57\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_8_57\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_8_57\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\16932\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr9_1\RVTDFNN-Measurement05-Jan-2024_15_8_57\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
 PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(7) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% PLOT nmse v.s. BW
figure(1);
iteration = 80:20:200;
plot(iteration,NMSE_withoutDPD,'-ro','Linewidth', 2, 'MarkerSize', 8);
hold on;
plot(iteration,NMSE_withDDRDPD,'-c+','Linewidth', 2, 'MarkerSize', 8);
hold on;
plot(iteration,NMSE_withRVTDFNNDPD,'-bs','Linewidth', 2, 'MarkerSize', 8);
hold on;
plot(iteration,NMSE_withARVTD_DNNDPD,'-m^','Linewidth', 2, 'MarkerSize', 8);
hold off;
grid on;
legend("w/o DPD","DDR","RVTDFNN","PROPOSED");
axis([80,210,-40,-10]);
ylabel("NMSE of proposed system/(dB)");
xlabel("Bandwidth/(MHz)");