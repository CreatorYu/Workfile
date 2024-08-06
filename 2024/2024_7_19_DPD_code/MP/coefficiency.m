clc;
clear;
t=load("E:\matlab\bin\CODE\mycode\data\test2.mat");
X1=t.X1;
V1=X1;
Y1=t.Y1(:,1);
Center_F=t.Center_frequency;
Channel_F=t.Channel_Freq;
Bnadwidth=t.Channel_BW;
Pin_Y1=t.Pin_Y1;
Pin_X1=t.Pin_X1;
G=10^((Pin_Y1-Pin_X1)/20);

K=5;Q=1;
N_y=length(Y1);                                                          %获取训练模块输入信号Y1的长度，以便于制备矩阵
N_x=((K+1)/2)*(Q+1);                                                        %因为K只能为奇数，Q的取值为0~Q；
U=zeros(N_y,N_x);                                                           %生成矩阵U
for k=1:(K+1)/2
    for q=1:Q+1
        if k==1
            U(:,q)=fun_delay(Y1,q-1);
        else
            U(:,(k-1)*(Q+1)+q)=fun_delay(Y1,q-1).*((abs(fun_delay(Y1,q-1))).^(2*k-2));
        end
    end
end
co_A=(inv(U'*U)*U')*V1;                                                        %求最小二乘解
co_A
save("E:\matlab\bin\CODE\mycode\test\Memorypolynomial\coefficiency.mat");