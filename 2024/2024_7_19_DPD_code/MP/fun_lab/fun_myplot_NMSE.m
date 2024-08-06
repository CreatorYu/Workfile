%% 绘制NMSE随Pin变化的图像——输入为NMSE向量，输出为图像，表示每次迭代后
function fun_myplot_NMSE(NMSE, figure_number)
% This function plot the gain versus the normalized input power
% SampleRate=3.84e6*4;
linestyle1=char('-ro', '-m*', '-c^', '-bv', '-gs', '-y>', '-k<');
m=length(NMSE);
%
figure(figure_number)
plot(0:m-1, NMSE,'-ro');
set(gca, 'XTick', 0:m-1)
axis([0 3 -50 -15]);
% set(gca,'XTickLabel',{'a','b','c'})
grid on
set(gcf,'color','w');
% h=legend('ACLR in','ACLR output Low','ACLR output Upper');
% set(h,'fontsize',14,'fontname','Times New Roman');
% title('DE vs Normalized Pout for various x_n','fontsize',14,'fontname','Times New Roman');
xlabel('Iterations','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('NMSE (dBc)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
end
