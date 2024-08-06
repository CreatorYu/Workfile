function fun_myplot_AM_PM_Normalized(IQ_in, IQ_out, figure_number, Arange, Lstyle)
% This function plot the Phase versus the normalized input power
Pin=abs(IQ_in).^2; Pinmax=max(Pin); PindB=10*log10(Pin/Pinmax);             %此处为功率比，单位为dB
IQ_N=IQ_out./IQ_in;
NF=length(IQ_N);
for i=1:NF
    PM(i)=phase(IQ_N(i))/pi*180;                                            %这里的相位指的是增益G的相位,并将其转化为度                                    
end
% Gain=abs(IQ_N).^2; GaindB=10*log10(Gain);
figure (figure_number)
plot(PindB, PM,Lstyle);
axis(Arange)
% axis(Axis_Limit);
set(gcf,'color','w');
% h=legend('x_n=0, OBO=4.78','x_n=1, OBO=6.27','x_n=2, OBO=8.77','x_n=3, OBO=11.04','x_n=4, OBO=12.97');
% set(h,'fontsize',14,'fontname','Times New Roman')
% title('DE vs Normalized Pout for various x_n','fontsize',14,'fontname','Times New Roman');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Phase (Degree)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
grid on
end
