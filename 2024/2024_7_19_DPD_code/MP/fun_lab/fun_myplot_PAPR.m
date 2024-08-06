function fun_myplot_PAPR(PAPR_in, PAPR_out, figure_number)
% This function plot the gain versus the normalized input power
% SampleRate=3.84e6*4;
linestyle1=char('-ro', '-m*', '-c^', '-bv', '-gs', '-y>', '-k<');
m=length(PAPR_out);
PAPR_in1=PAPR_in*ones(m,1);
%
figure(figure_number)
plot(0:m-1, PAPR_in1,'-ro');
hold on
plot(0:m-1, PAPR_out, '-m*');
hold off
set(gca, 'XTick', 0:m-1)
% set(gca,'XTickLabel',{'a','b','c'})
grid on
set(gcf,'color','w');
h=legend('Input','Output');
set(h,'fontsize',14,'fontname','Times New Roman');
% title('DE vs Normalized Pout for various x_n','fontsize',14,'fontname','Times New Roman');
xlabel('Iterations','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('PAPR (dBc)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
end
