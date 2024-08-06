figure(1);
plot(PindB,AM1,'r.');
hold on;
plot(PindB,AM2,'b.');
hold on;
plot(PindB,AM3,'g.');
hold on;
plot(PindB,AM4,'k.');
h=legend('without DPD','after MP DPD iter1','after MP DPD iter2','after MP DPD iter3');                             
set(h,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Gain (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
axis([-30 0 15 25]); set(gcf,'color','w');
grid on
hold off

figure(2)
plot(PindB,PM1,'r.');
hold on; 
plot(PindB,PM2,'b.');
hold on;
plot(PindB,PM3,'g.');
hold on;
plot(PindB,PM4,'k.');
n=legend('without DPD','after MP DPD iter1','after MP DPD iter2','after MP DPD iter3');     
set(n,'fontsize',14,'fontname','Times New Roman');
set(gcf,'color','w');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Phase (degree)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
set(gcf,'color','w');
axis([-40 0 -40 40]);
grid on
hold off