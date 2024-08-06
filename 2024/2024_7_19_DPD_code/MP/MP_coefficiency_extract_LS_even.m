%% 包含奇阶项的记忆多项式
function A = MP_coefficiency_extract_LS_even(V1,input,K,Q,Gain)
%   采样最小二乘法进行参数提取
Y1=input/Gain;                                                             %进行增益归一化处理
N_y=length(input);                                                          %获取训练模块输入信号Y1的长度，以便于制备矩阵
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
% A=((U'*U)\U')*V1;
%下面的语法是MATLAB中的一种方便的方法，用于计算最小二乘解（Least Squares Solution）。
A = U\V1;
%这种写法是MATLAB的一种特性，它实际上在背后执行了最小二乘法的计算，无需显式编写求解最小二乘的矩阵方程的代码。
end
