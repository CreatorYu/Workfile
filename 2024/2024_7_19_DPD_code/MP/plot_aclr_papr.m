path("E:\matlab\bin\CODE\mycode\fun_lab",path);
[aclr_in,papr_in,~]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,X1);
[aclr_out1,papr_out1,~]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,Y(:,1));
[aclr_out2,papr_out2,~]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,Y(:,2));
[aclr_out3,papr_out3,~]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,Y(:,3));
[aclr_out4,papr_out4,~]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,Y(:,4));
[aclr_out5,papr_out5,~]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,Y(:,5));
[aclr_out6,papr_out6,~]= fun_ACLR_PAPR_Channel_Power_cal(Samplerate, Channel_F, Bandwidth,Y(:,6));



N_iter=6;
aclr_low=[aclr_out1(1),aclr_out2(1),aclr_out3(1),aclr_out4(1),aclr_out5(1),aclr_out6(1)];
aclr_high=[aclr_out1(2),aclr_out2(2),aclr_out3(2),aclr_out4(2),aclr_out5(2),aclr_out6(2)];
papr=[papr_out1,papr_out2,papr_out3,papr_out4,papr_out5,papr_out6];

figure(1);
plot(0:N_iter-1,aclr_high,"-ro");
hold on;
plot(0:N_iter-1,aclr_low,"-b+");
hold on;
plot(0:N_iter-5,aclr_in,"-g*");
hold off;
h=legend("L aclr","H aclr","in aclr");
set(h,'fontsize',14,'fontname','华文宋体');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
xlabel("迭代次数N",'fontsize',15,'fontname','华文宋体','fontweight','b');
ylabel("ACLR",'fontsize',15,'fontname','Times New Roman','fontweight','b'); 
axis([0 4 -80 -20]);

figure(2);
plot(0:N_iter-1,papr);
hold on;
papr_in1=[papr_in,papr_in,papr_in];
plot(0:N_iter-1,papr_in);
hold off;
n=legend("L aclr","H aclr");
set(n,'fontsize',14,'fontname','华文宋体');                           %将标签的字体、间距以及最大字号进行限制；fontsize表示字号，fontname表示华文中宋，Times New Roman表示英文字体 
set(gcf,'color','w');
xlabel("迭代次数N",'fontsize',15,'fontname','华文宋体','fontweight','b');
ylabel("PAPR",'fontsize',15,'fontname','Times New Roman','fontweight','b'); 