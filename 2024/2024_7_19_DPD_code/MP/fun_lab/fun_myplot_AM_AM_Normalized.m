function fun_myplot_AM_AM_Normalized(IQ_in, IQ_out, figure_number, A_range, Lstyle)
%IQ_in表示输入正交信号，IQ_out表示输出正交信号，figure_number表示图像序号，A_range表示图像范围，Lstyle表示曲线类型
% This function plot the gain versus the normalized input power——这个函数表示增益与归一化输入功率的关系
Pin=abs(IQ_in).^2; Pinmax=max(Pin); PindB=10*log10(Pin/Pinmax);             %此处的PindB则表示归一化功率，此dB表示功率之比
IQ_N=IQ_out./IQ_in;
Gain=abs(IQ_N).^2; GaindB=10*log10(Gain);                                   %此dB表示幅值之比
figure (figure_number)
plot(PindB, GaindB,Lstyle);     
% axis([-30 0 15 25])
axis(A_range)
set(gcf,'color','w');                                                       %gcf返回当前Figure对象的句柄值
% h=legend('x_n=0, OBO=4.78','x_n=1, OBO=6.27','x_n=2, OBO=8.77','x_n=3, OBO=11.04','x_n=4, OBO=12.97');
% set(h,'fontsize',14,'fontname','Times New Roman')
% title('DE vs Normalized Pout for various x_n','fontsize',14,'fontname','Times New Roman');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Gain (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
grid on
end
