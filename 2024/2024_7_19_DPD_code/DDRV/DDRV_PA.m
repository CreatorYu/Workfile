Y2 = U*coefficiency;
Y=[Y1 Y2];
NMSE = fun_NMSE_cal(Y1,Y2);disp(NMSE);
[PindB, AM(:,1), PM(:,1)]=fun_AM_PM_cal(X1, Y(:,1));
[~, AM(:,2), PM(:,2)]=fun_AM_PM_cal(X1, Y(:,2));
[~,PoutdB1,~]=AM_PM_cal(X1,Y(:,1));
[~,PoutdB2,~]=AM_PM_cal(X1,Y(:,2));
figure(3);
plot(PindB,PoutdB1,'.g');
axis([-23 0 -25 0]);
grid on;
hold on;
plot(PindB,PoutdB2,'.k');
axis([-23 0 -25 0]);
grid on;
hold off;
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Normalized out Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
h=legend('Original AM-AM','DDRV AM-AM');
set(h,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
figure(1);
plot(PindB,AM(:,1),'r.');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Gain (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
n=legend("K=3,Q=3");
set(n,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
axis([-20 0 13 28]); set(gcf,'color','w');
grid on
figure(2);
plot(PindB,AM(:,2),'b.');
xlabel('Normalized input Power (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');
ylabel('Gain (dB)','fontsize',15,'fontname','Times New Roman','fontweight','b');    
z=legend("K=3,Q=3");
set(z,'fontsize',14,'fontname','Times New Roman');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
axis([-20 0 13 28]); set(gcf,'color','w');
grid on