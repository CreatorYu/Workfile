close all;
clear;
clc;


path("D:\Matlab\Xiaohu_Fang\SingleCarrier_DPD_Automation_v1_140411\usefull functions",path);
path("D:\Matlab\Xiaohu_Fang\SingleCarrier_DPD_Automation_v1_140411\usefull functions\delayAdjustment",path);


%% Signal configuraion
Center_F = 2.4e9;
BW = 200e6; 
Fs = 5*BW;   %Sample rate of data for DPD.


%% Processing data of Without DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ML-Measurement16-Jan-2024_16_1_2\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ML-Measurement16-Jan-2024_16_1_2\Q_Input_NoDPD_1.txt");
Output_I_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ML-Measurement16-Jan-2024_16_1_2\I_Output_WithoutDPD.txt");
Output_Q_withoutDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ML-Measurement16-Jan-2024_16_1_2\Q_Output_WithoutDPD.txt");

[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD, 0) ;
[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD) ;
[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD);
PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD);
% PlotSpectrum(Input_I_origin, Input_Q_origin, Output_I_withoutDPD, Output_Q_withoutDPD);

%% Processing data of With DDR-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DDR-Measurement16-Jan-2024_16_2_25\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DDR-Measurement16-Jan-2024_16_2_25\Q_Input_NoDPD_1.txt");
Output_I_withDDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DDR-Measurement16-Jan-2024_16_2_25\I_Output_WithDPD_1.txt");
Output_Q_withDDRDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DDR-Measurement16-Jan-2024_16_2_25\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD, 0) ;
[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD) ;
[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD);
PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withDDRDPD, Output_Q_withDDRDPD);

%% Processing data of With ARVTDFNN-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\Q_Input_NoDPD_1.txt");
Output_I_withARVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\I_Output_WithDPD_1.txt");
Output_Q_withARVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD, 0) ;
[Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD) ;
[Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD, 0);
% 
PlotGain(Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD);
PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withARVTDFNNDPD, Output_Q_withARVTDFNNDPD);

 %% Processing data of With MP-DPD
% Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Input_NoDPD_1.txt");
% Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Input_NoDPD_1.txt");
% Output_I_withMPDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Output_WithDPD_1.txt");
% Output_Q_withMPDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Output_WithDPD_1.txt");
% 
% [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD, 0) ;
% [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD) ;
% [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD,Fs,2000) ;
% [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD, 0);
% 
% PlotGain(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD);
% PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD);

% %% Processing data of With RVTDFNN-DPD
% Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\I_Input_NoDPD_1.txt");
% Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\Q_Input_NoDPD_1.txt");
% Output_I_withRVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\I_Output_WithDPD_1.txt");
% Output_Q_withRVTDFNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\RVTDFNN-Measurement16-Jan-2024_16_3_45\Q_Output_WithDPD_1.txt");
% 
% [Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD, 0) ;
% [Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD) ;
% [Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD,Fs,2000) ;
% [Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD, 0);
% 
% PlotGain(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD);
% PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withRVTDFNNDPD, Output_Q_withRVTDFNNDPD);
% 
% % %% Processing data of With MP-DPD
% % Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Input_NoDPD_1.txt");
% % Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Input_NoDPD_1.txt");
% % Output_I_withMPDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\I_Output_WithDPD_1.txt");
% % Output_Q_withMPDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档\100MHz_78r0_papr8_1\MP-Measurement03-Jan-2024_18_50_18\Q_Output_WithDPD_1.txt");
% % 
% % [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD, 0) ;
% % [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = UnifyLength(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD) ;
% % [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustDelay(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD,Fs,2000) ;
% % [Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD, 0);
% % 
% % PlotGain(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD);
% % PlotAMPM(Input_I_origin, Input_Q_origin, Output_I_withMPDPD, Output_Q_withMPDPD);

%% Processing data of With AVTD-DNN-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ARVTD-DNN-Measurement16-Jan-2024_16_7_4\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ARVTD-DNN-Measurement16-Jan-2024_16_7_4\Q_Input_NoDPD_1.txt");
Output_I_withARVTD_DNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ARVTD-DNN-Measurement16-Jan-2024_16_7_4\I_Output_WithDPD_1.txt");
Output_Q_withARVTD_DNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\ARVTD-DNN-Measurement16-Jan-2024_16_7_4\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD, 0) ;
[Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = UnifyLength(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD) ;
[Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = AdjustDelay(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD);
PlotAMPM(Input_I_origin, Input_Q_origin,  Output_I_withARVTD_DNNDPD, Output_Q_withARVTD_DNNDPD);

%% Processing data of With DNN-DPD
Input_I_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DNN-Measurement16-Jan-2024_16_27_34\I_Input_NoDPD_1.txt");
Input_Q_origin = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DNN-Measurement16-Jan-2024_16_27_34\Q_Input_NoDPD_1.txt");
Output_I_with_DNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DNN-Measurement16-Jan-2024_16_27_34\I_Output_WithDPD_1.txt");
Output_Q_with_DNNDPD = importdata("C:\Users\abc\Desktop\workfile\SLCG测试文档2\200MHz\DNN-Measurement16-Jan-2024_16_27_34\Q_Output_WithDPD_1.txt");

[Input_I_origin, Input_Q_origin, Output_I_with_DNNDPD, Output_Q_with_DNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD, 0) ;
[Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD] = UnifyLength(Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD) ;
[Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD] = AdjustDelay(Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD,Fs,2000) ;
[Input_I_origin, Input_Q_origin, Output_I_with_DNNDPD, Output_Q_with_DNNDPD] = AdjustPowerAndPhase(Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD, 0);

PlotGain(Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD);
PlotAMPM(Input_I_origin, Input_Q_origin,  Output_I_with_DNNDPD, Output_Q_with_DNNDPD);

close all;
%% PLOT spectrum
Spectrum_generator(Output_I_withoutDPD, Output_Q_withoutDPD,Output_I_withARVTDFNNDPD,Output_Q_withARVTDFNNDPD,Output_I_withDDRDPD,Output_Q_withDDRDPD,Output_I_withARVTD_DNNDPD,Output_Q_withARVTD_DNNDPD,Output_I_with_DNNDPD, Output_Q_with_DNNDPD);
