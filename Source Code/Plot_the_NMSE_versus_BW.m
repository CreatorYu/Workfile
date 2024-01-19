close all;
clear;
clc;
path("D:\Matlab\Xiaohu_Fang\SingleCarrier_DPD_Automation_v1_140411\usefull functions",path);
path("E:\matlab\bin\CODE\workfile\PAMODEL_RVFTDNN",path);
path("C:\Users\abc\Desktop\workfile\SLCG测试文档",path);
BW = [80e6, 100e6, 120e6, 140e6, 160e6, 180e6, 200e6, 220e6, 240e6];
Fs = 5.*BW;
NMSE_withoutDPD = zeros(1,7);
NMSE_withDDRDPD = zeros(1,7);
NMSE_withRVTDFNNDPD = zeros(1,7);
NMSE_withARVTD_DNNDPD = zeros(1,7);
NMSE_withMLDPD = zeros(1,7);
%% load data Without DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\Q_Output_WithoutDPD.txt");
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
NMSE_withoutDPD(1) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withoutDPD(1:9000); Out_Q_withoutDPD(1:9000)]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\Q_Output_WithoutDPD.txt");
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
NMSE_withoutDPD(2) = fun_nmse([In_I_origin(1:9000);In_Q_origin(1:9000)],[Out_I_withoutDPD(1:9000);Out_Q_withoutDPD]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\Q_Output_WithoutDPD.txt");
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
NMSE_withoutDPD(3) = fun_nmse([In_I_origin(1:9000), In_Q_origin(1:9000)],[Out_I_withoutDPD(1:9000), Out_Q_withoutDPD(1:9000)]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\Q_Output_WithoutDPD.txt");
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
NMSE_withoutDPD(4) = fun_nmse([In_I_origin(1:9000), In_Q_origin(1:9000)],[Out_I_withoutDPD(1:9000), Out_Q_withoutDPD(1:9000)]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\Q_Output_WithoutDPD.txt");
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
NMSE_withoutDPD(5) = fun_nmse([In_I_origin(1:9000), In_Q_origin(1:9000)],[Out_I_withoutDPD(1:9000), Out_Q_withoutDPD(1:9000)]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\Q_Output_WithoutDPD.txt");
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
NMSE_withoutDPD(6) = fun_nmse([In_I_origin(1:9000), In_Q_origin(1:9000)],[Out_I_withoutDPD(1:9000), Out_Q_withoutDPD(1:9000)]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\Q_Input_NoDPD_1.txt");
Out_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\I_Output_WithoutDPD.txt");
Out_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\Q_Output_WithoutDPD.txt");
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
NMSE_withoutDPD(7) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withoutDPD(1:9000); Out_Q_withoutDPD(1:9000)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% load data With ML-DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ML-Measurement14-Jan-2024_17_49_25\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ML-Measurement14-Jan-2024_17_49_25\Q_Input_NoDPD_1.txt");
Out_I_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ML-Measurement14-Jan-2024_17_49_25\I_Output_WithoutDPD.txt");
Out_Q_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ML-Measurement14-Jan-2024_17_49_25\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]  = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0);
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withMLDPD(1) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withMLDPD(1:9000); Out_Q_withMLDPD(1:9000)]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ML-Measurement14-Jan-2024_17_44_45\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ML-Measurement14-Jan-2024_17_44_45\Q_Input_NoDPD_1.txt");
Out_I_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ML-Measurement14-Jan-2024_17_44_45\I_Output_WithoutDPD.txt");
Out_Q_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ML-Measurement14-Jan-2024_17_44_45\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD,Fs(2),2000) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withMLDPD(2) = fun_nmse([In_I_origin(1:9000);In_Q_origin(1:9000)],[Out_I_withMLDPD(1:9000);Out_Q_withMLDPD(1:9000)]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ML-Measurement14-Jan-2024_17_12_23\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ML-Measurement14-Jan-2024_17_12_23\Q_Input_NoDPD_1.txt");
Out_I_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ML-Measurement14-Jan-2024_17_12_23\I_Output_WithoutDPD.txt");
Out_Q_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ML-Measurement14-Jan-2024_17_12_23\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD,Fs(3),2000) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withMLDPD(3) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withMLDPD(1:9000);Out_Q_withMLDPD(1:9000)]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ML-Measurement14-Jan-2024_17_53_37\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ML-Measurement14-Jan-2024_17_53_37\Q_Input_NoDPD_1.txt");
Out_I_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ML-Measurement14-Jan-2024_17_53_37\I_Output_WithoutDPD.txt");
Out_Q_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ML-Measurement14-Jan-2024_17_53_37\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD,Fs(4),2000) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withMLDPD(4) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withMLDPD(1:9000);Out_Q_withMLDPD(1:9000)]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ML-Measurement14-Jan-2024_17_55_36\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ML-Measurement14-Jan-2024_17_55_36\Q_Input_NoDPD_1.txt");
Out_I_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ML-Measurement14-Jan-2024_17_55_36\I_Output_WithoutDPD.txt");
Out_Q_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ML-Measurement14-Jan-2024_17_55_36\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD,Fs(5),2000) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withMLDPD(5) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withMLDPD(1:9000);Out_Q_withMLDPD(1:9000)]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ML-Measurement14-Jan-2024_17_58_1\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ML-Measurement14-Jan-2024_17_58_1\Q_Input_NoDPD_1.txt");
Out_I_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ML-Measurement14-Jan-2024_17_58_1\I_Output_WithoutDPD.txt");
Out_Q_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ML-Measurement14-Jan-2024_17_58_1\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withMLDPD(6) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withMLDPD(1:9000);Out_Q_withMLDPD(1:9000)]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ML-Measurement14-Jan-2024_17_59_43\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ML-Measurement14-Jan-2024_17_59_43\Q_Input_NoDPD_1.txt");
Out_I_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ML-Measurement14-Jan-2024_17_59_43\I_Output_WithoutDPD.txt");
Out_Q_withMLDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ML-Measurement14-Jan-2024_17_59_43\Q_Output_WithoutDPD.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withMLDPD,Out_Q_withMLDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withMLDPD, Out_Q_withMLDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withoutDPD, Out_Q_withoutDPD) ;
% calculate NMSE
NMSE_withMLDPD(7) = fun_nmse([In_I_origin(1:9000); In_Q_origin(1:9000)],[Out_I_withMLDPD(1:9000);Out_Q_withMLDPD(1:9000)]);
%% load data With DDR-DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\DDR-Measurement11-Jan-2024_19_25_17\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(1) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\DDR-Measurement11-Jan-2024_19_17_22\Q_Output_WithDPD_1.txt");
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
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\DDR-Measurement11-Jan-2024_19_10_26\Q_Output_WithDPD_1.txt");
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
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\DDR-Measurement11-Jan-2024_18_4_1\Q_Output_WithDPD_1.txt");
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
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\DDR-Measurement11-Jan-2024_18_16_5\Q_Output_WithDPD_1.txt");
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
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\DDR-Measurement11-Jan-2024_18_23_27\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(6) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\Q_Input_NoDPD_1.txt");
Out_I_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\I_Output_WithDPD_1.txt");
Out_Q_with_DDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\DDR-Measurement12-Jan-2024_13_41_59\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_DDRDPD, Out_Q_with_DDRDPD) ;
% calculate NMSE
NMSE_withDDRDPD(7) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_DDRDPD;Out_Q_with_DDRDPD]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% load data Without ARVTD-DNN-DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_47_56\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_47_56\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_47_56\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_47_56\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(1) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_41_0\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_41_0\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_41_0\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_41_0\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(2),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(2) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_27_4\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_27_4\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_27_4\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\ARVTD-DNN-Measurement14-Jan-2024_17_27_4\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(3),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(3) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ARCTD-DNN-Measurement11-Jan-2024_18_11_28\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ARCTD-DNN-Measurement11-Jan-2024_18_11_28\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ARCTD-DNN-Measurement11-Jan-2024_18_11_28\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\ARCTD-DNN-Measurement11-Jan-2024_18_11_28\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(4),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(4) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ARVTD-DNNMeasurement11-Jan-2024_18_21_18\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ARVTD-DNNMeasurement11-Jan-2024_18_21_18\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ARVTD-DNNMeasurement11-Jan-2024_18_21_18\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\ARVTD-DNNMeasurement11-Jan-2024_18_21_18\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(5),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(5) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ARVTD-DNN-Measurement11-Jan-2024_18_29_38\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ARVTD-DNN-Measurement11-Jan-2024_18_29_38\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ARVTD-DNN-Measurement11-Jan-2024_18_29_38\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\ARVTD-DNN-Measurement11-Jan-2024_18_29_38\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(6) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ARVTD-DNN-Measurement12-Jan-2024_14_5_13\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ARVTD-DNN-Measurement12-Jan-2024_14_5_13\Q_Input_NoDPD_1.txt");
Out_I_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ARVTD-DNN-Measurement12-Jan-2024_14_5_13\I_Output_WithDPD_1.txt");
Out_Q_withARVTDDNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\ARVTD-DNN-Measurement12-Jan-2024_14_5_13\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PlotGain(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% PlotAMPM(In_I_origin, In_Q_origin, Out_I_withARVTDDNNDPD, Out_Q_withARVTDDNNDPD) ;
% calculate NMSE
NMSE_withARVTD_DNNDPD(7) = fun_nmse([In_I_origin; In_Q_origin],[Out_I_withARVTDDNNDPD;Out_Q_withARVTDDNNDPD]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% load data With RVTDFNN-DPD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% In 80MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_17_49_29\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_17_49_29\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_17_49_29\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\80MHz_64r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_17_49_29\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(1),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(1) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 100MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_19_18_54\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_19_18_54\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_19_18_54\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_19_18_54\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(2),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(2) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 120MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\RVTDFNN-Measurement14-Jan-2024_17_19_40\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\RVTDFNN-Measurement14-Jan-2024_17_19_40\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\RVTDFNN-Measurement14-Jan-2024_17_19_40\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\120MHz_96r0_papr8_5\RVTDFNN-Measurement14-Jan-2024_17_19_40\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(3),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(3) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 140MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_13_44\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_13_44\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_13_44\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\140MHz_112r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_13_44\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(4),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% % calculate NMSE
NMSE_withRVTDFNNDPD(4) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 160MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_17_31\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_17_31\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_17_31\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\160MHz_128r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_17_31\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(5),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(5) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 180MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_25_16\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_25_16\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_25_16\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\180MHz_144r0_papr8_5\RVTDFNN-Measurement11-Jan-2024_18_25_16\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(6),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% calculate NMSE
NMSE_withRVTDFNNDPD(6) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);

%% In 200MHz BW
In_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\RVTDFNN-Measurement12-Jan-2024_13_44_39\I_Input_NoDPD_1.txt");
In_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\RVTDFNN-Measurement12-Jan-2024_13_44_39\Q_Input_NoDPD_1.txt");
Out_I_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\RVTDFNN-Measurement12-Jan-2024_13_44_39\I_Output_WithDPD_1.txt");
Out_Q_with_RVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\200MHz_160r0_papr8_5\RVTDFNN-Measurement12-Jan-2024_13_44_39\Q_Output_WithDPD_1.txt");
% Process data
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]  = UnifyLength(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD);
% delay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, timedelay1] = AdjustDelay(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD,Fs(7),2000) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
[In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD]             = AdjustPowerAndPhase(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD, 0) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PlotGain(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
%  PlotAMPM(In_I_origin, In_Q_origin, Out_I_with_RVTDFNNDPD, Out_Q_with_RVTDFNNDPD) ;
% % calculate NMSE
NMSE_withRVTDFNNDPD(7) = fun_nmse([In_I_origin;In_Q_origin],[Out_I_with_RVTDFNNDPD;Out_Q_with_RVTDFNNDPD]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;

%% PLOT nmse v.s. BW
figure(1);
iteration = 80:20:200;
plot(iteration,NMSE_withoutDPD,'-ro','Linewidth', 2, 'MarkerSize', 8);
hold on;
plot(iteration,NMSE_withMLDPD,'-g*','Linewidth', 2, 'MarkerSize', 8);
hold on;
plot(iteration,NMSE_withDDRDPD,'-c+','Linewidth', 2, 'MarkerSize', 8);
hold on;
plot(iteration,NMSE_withRVTDFNNDPD,'-bs','Linewidth', 2, 'MarkerSize', 8);
hold on;
plot(iteration,NMSE_withARVTD_DNNDPD,'-m^','Linewidth', 2, 'MarkerSize', 8);
hold off;
grid on;
legend("w/o DPD","ML","DDR","RVTDFNN","PROPOSED");
axis([80,210,-40,-10]);
ylabel("NMSE of proposed system/(dB)");
xlabel("Bandwidth/(MHz)");
title("NMSE(dB) of system v.s. BW(MHz)");