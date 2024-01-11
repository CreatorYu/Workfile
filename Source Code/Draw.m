close all;
clear;
clc;

path("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1",path);
path("D:\Matlab\Xiaohu_Fang\SingleCarrier_DPD_Automation_v1_140411\usefull functions",path);
path("D:\Matlab\Xiaohu_Fang\SingleCarrier_DPD_Automation_v1_140411\usefull functions\delayAdjustment",path);


%% Signal configuraion
Center_F = 2.4e9;
BW = 100e6; 
Fs = 5*BW;   %Sample rate of data for DPD.


%% Processing data of Without DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Input_NoDPD_1.txt");
Output_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Output_WithoutDPD.txt");
Output_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Output_WithoutDPD.txt");

[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD, 0) ;
[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD) ;
[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD);
PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD);
% PlotSpectrum(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD);

%% Processing data of With DDR-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\Q_Input_NoDPD_1.txt");
Output_I_withDDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\I_Output_WithDPD_1.txt");
Output_Q_withDDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\DDR-Measurement03-Jan-2024_18_27_45\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD, 0) ;
[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD) ;
[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD);
PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD);

%% Processing data of With RVTDFNN-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\Q_Input_NoDPD_1.txt");
Output_I_withRVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\I_Output_WithDPD_1.txt");
Output_Q_withRVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\RVTDFNN-Measurement03-Jan-2024_18_32_34\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD, 0) ;
[Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD) ;
[Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD);
PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD);

%% Processing data of With MP-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Input_NoDPD_1.txt");
Output_I_withMPDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Output_WithDPD_1.txt");
Output_Q_withMPDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD, 0) ;
[Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD) ;
[Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD);
PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD);

%% Processing data of With AVTD-DNN-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\Q_Input_NoDPD_1.txt");
Output_I_withARVTD_DNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\I_Output_WithDPD_1.txt");
Output_Q_withARVTD_DNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\ARVTD-DNN-Measurement03-Jan-2024_18_36_52\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD, 0) ;
[Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = UnifyLength(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD) ;
[Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = AdjustDelay(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD);
PlotAMPM(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD);

%% PLOT spectrum
Spectrum_generator(Output_I_withoutDPD, Output_Q_withoutDPD,Output_I_withRVTDFNNDPD,Output_Q_withRVTDFNNDPD,Output_I_withDDRDPD,Output_Q_withDDRDPD,Output_I_withARVTD_DNNDPD,Output_Q_withARVTD_DNNDPD,Output_I_withMPDPD, Output_Q_withMPDPD);
