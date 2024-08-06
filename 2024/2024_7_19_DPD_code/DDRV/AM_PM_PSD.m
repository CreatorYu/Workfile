AM_best=AM(:,index_best);
PM_best=PM(:,index_best);
figure(1);
plot(PindB,AM(:,1),'r.');
hold on;
plot(PindB,AM_best,'b.');
% hold on;
% plot(PindB,AM3,'g.');
% hold on;
% plot(PindB,AM4,'k.');
h=legend('without DPD','after DDRV DPD');                             
set(h,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Gain (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
axis([-20 0 13 28]); set(gcf,'color','w');
grid on
hold off

figure(2)
plot(PindB,PM(:,1),'r.');
hold on; 
plot(PindB,PM_best,'b.');
% hold on;
% plot(PindB,PM3,'g.');
% hold on;
% plot(PindB,PM4,'k.');
n=legend('without DPD','after DDRV DPD');     
set(n,'fontsize',14,'fontname','Times New Roman');
set(gcf,'color','w');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Phase (degree)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
set(gcf,'color','w');
axis([-25 0 -40 40]);
grid on
hold off


path("E:\matlab\bin\CODE\mycode\fun_lab",path);
path("E:\matlab\bin\CODE\DPD_Research",path);


Spectrum(X1,Y,3, Samplerate,Center_F,index_best);                         %输出有无DPD情况下的PSD图
fun_myplot_spectrum(X1, Y, 4, Samplerate,Center_F);                         %展示DPD运行过程中PSD的变换

fun_myplot_ACLR(ACLR_in,ACLR_out, 5);
fun_myplot_NMSE(NMSE, 6);
fun_myplot_PAPR(PAPR_in, PAPR_out, 7);