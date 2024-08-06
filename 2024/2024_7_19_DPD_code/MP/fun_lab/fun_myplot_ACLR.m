function fun_myplot_ACLR(ACLR_in,ACLR_out, figure_number)
% This function plot the gain versus the normalized input power
% SampleRate=3.84e6*4;
linestyle1=char('-ro', '-m*', '-c^', '-bv', '-gs', '-y>', '-k<');
[m,~]=size(ACLR_out);
ACLR_in1=ones(m,1)*mean(ACLR_in);
%
figure(figure_number)
plot(0:m-1, ACLR_in1,'-ro');
hold on
plot(0:m-1, ACLR_out(:,1),'-bv');
plot(0:m-1, ACLR_out(:,2),'-gs');
set(gca, 'XTick', 0:m-1)
axis([0 3 -70 -30]); 
% set(gca,'XTickLabel',{'a','b','c'})
grid on
set(gcf,'color','w');
h=legend('ACLR in','ACLR output Low','ACLR output Upper');
set(h,'fontsize',14,'fontname','Times New Roman')
% title('DE vs Normalized Pout for various x_n','fontsize',14,'fontname','Times New Roman');
xlabel('Iterations','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('ACLR (dBc)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
hold off  
end
