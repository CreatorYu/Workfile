%% This function is used to plot the Spectrum
function Spectrum_generator(Output_I_withoutDPD, Output_Q_withoutDPD,Output_I_withRVTDFNNDPD,Output_Q_withRVTDFNNDPD,Output_I_withDDRDPD,Output_Q_withDDRDPD,Output_I_withARVTD_DNNDPD,Output_Q_withARVTD_DNNDPD,Output_I_with_DNNDPD, Output_Q_with_DNNDPD)
%     [In_I, In_Q, Out_I, Out_Q] = UnifyLength(In_I, In_Q, Out_I, Out_Q);
        xout_withoutDPD = complex(Output_I_withoutDPD, Output_Q_withoutDPD) ; 
        xout_withRVTDFNNDPD = complex(Output_I_withRVTDFNNDPD,Output_Q_withRVTDFNNDPD) ; 
        xout_withDDRDPD = complex(Output_I_withDDRDPD,Output_Q_withDDRDPD) ;
        xout_withARVTD_DNNDPD = complex(Output_I_withARVTD_DNNDPD,Output_Q_withARVTD_DNNDPD) ;
        xout_with_DNNDPD = complex(Output_I_with_DNNDPD, Output_Q_with_DNNDPD) ;
%         xout_withMPDPD = complex(Output_I_withMPDPD, Output_Q_withMPDPD);
        % check if Fs and h are given as input variable or set them to
        % default values
    switch nargin
        % nargin�������ж�������������ĺ����������Ϳ�����Բ�ͬ�����ִ�в�ͬ�Ĺ��ܡ�
        case 10
            id = 0 ;
            Fs = 1000e6;                     %Fs���źŵĲ���Ƶ��
            h = spectrum.welch ;        
            h.OverlapPercent = 95 ;         % �ص���
            h.SegmentLength = 4096 ;        % �ֶγ���
            h.windowName = 'Flat Top';      % 
        case 5
            Fs = 92.16e6; %default value
            h = spectrum.welch ;
            h.OverlapPercent = 95 ;
            h.SegmentLength = 4096;
            h.windowName = 'Flat Top';
        case 6
            h = spectrum.welch ;
            h.OverlapPercent = 95 ;
            h.SegmentLength = 4096 ;
            h.windowName = 'Flat Top';
    end
    if id
        figure(id)
    else
        figure()
    end
        hold on
        grid on
        PSDout_withoutDPD = plot(msspectrum(h, xout_withoutDPD,'Fs', Fs,'CenterDC',true)) ;
            set(PSDout_withoutDPD, 'Color', 'blue', 'LineWidth', 1) ;
        PSDout_withRVTDFNNDPD = plot(msspectrum(h, xout_withRVTDFNNDPD,'Fs', Fs,'CenterDC',true)) ;
            set(PSDout_withRVTDFNNDPD, 'Color', 'g', 'LineWidth', 1 ) ;
        PSDout_withDDRDPD = plot(msspectrum(h, xout_withDDRDPD,'Fs', Fs,'CenterDC',true)) ;%centerdc
            set(PSDout_withDDRDPD, 'Color', 'red', 'LineWidth', 1 ) ;
        PSDout_with_DNNDPD = plot(msspectrum(h, xout_with_DNNDPD,'Fs', Fs,'CenterDC',true)) ;
            set(PSDout_with_DNNDPD, 'Color', 'k', 'LineWidth', 1 ) ;
        PSDout_withARVTD_DNNDPD = plot(msspectrum(h, xout_withARVTD_DNNDPD,'Fs', Fs,'CenterDC',true)) ;
            set(PSDout_withARVTD_DNNDPD, 'Color', 'm', 'LineWidth', 1 ) ;
        axis([-400 400 -90 -30]);
%         PSDout_withoutDPD = plot(msspectrum(h, xout_withoutDPD,'CenterDC',Fs)) ;
%             set(PSDout_withoutDPD, 'Color', 'blue', 'LineWidth', 1) ;
%         PSDout_withRVTDFNNDPD = plot(msspectrum(h, xout_withRVTDFNNDPD,'CenterDC',Fs)) ;
%             set(PSDout_withRVTDFNNDPD, 'Color', 'g', 'LineWidth', 1 ) ;
%         PSDout_withDDRDPD = plot(msspectrum(h, xout_withDDRDPD,'CenterDC',Fs)) ;%centerdc
%             set(PSDout_withDDRDPD, 'Color', 'red', 'LineWidth', 1 ) ;
%         PSDout_with_DNNDPD = plot(msspectrum(h, xout_with_DNNDPD,'CenterDC',Fs)) ;
%             set(PSDout_with_DNNDPD, 'Color', 'k', 'LineWidth', 1 ) ;
%         PSDout_withARVTD_DNNDPD = plot(msspectrum(h, xout_withARVTD_DNNDPD,'CenterDC',Fs)) ;
%             set(PSDout_withARVTD_DNNDPD, 'Color', 'm', 'LineWidth', 1 ) ;
        legend( 'w/o DPD' , 'ARVTDFNN' , 'DDR' , 'DNN' ,'PROPOSED');
        hold off
