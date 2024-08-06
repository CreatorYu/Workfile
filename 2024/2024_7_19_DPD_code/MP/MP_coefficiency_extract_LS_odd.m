%% 包含偶阶项的记忆多项式
function A = MP_coefficiency_extract_LS_odd(V1,input,K,Q,Gain)
%   采样最小二乘法进行参数提取
Y1=input/Gain;                                                             %进行增益归一化处理
N_y=length(input);                                                          %获取训练模块输入信号Y1的长度，以便于制备矩阵
N_x=K*(Q+1);
U=zeros(N_y,N_x);                                                           %生成矩阵U
for k=1:K
    for q=1:Q+1
        if k==1
            U(:,q)=fun_delay(Y1,q-1);
        else
            U(:,(k-1)*(Q+1)+q)=fun_delay(Y1,q-1).*((abs(fun_delay(Y1,q-1))).^(k-1));
        end
    end
end
%A=((U'*U)\U')*V1;                                                          %((U'*U)\U')*V1 并不是一个通用的最小二乘法形式。它是一种矩阵操作，涉及到矩阵乘法和逆矩阵运算，通常用于解决矩阵方程而不是数据拟合问题
A=U\V1;                                                                     %最小二乘法：\运算符通常用于解决线性方程组，是最小二乘法的一种应用
end

