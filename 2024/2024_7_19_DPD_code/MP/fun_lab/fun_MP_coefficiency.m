%% 运用最小二乘法提取memorypolynomial模型预失真器的参数
function A1=fun_MP_coefficiency(Y1, V1, K, Q)
Nx=length(Y1);                                                              %Nx表示输入信号的长度
N1=(K+1)/2*(Q+1);                                                           %N2=25
U=zeros(Nx,N1);                                                             %生成矩阵，代替式(46)
for k=1:(K+1)/2                                                                   %T1在此处为式(27)中的Q
    for i=1:Q+1                                                               %M1在此处为式(27)中的K
        if k==1
            U(:,i)=fun_delay(Y1,i-1);
        else
            U(:,(k-1)*(Q+1)+i)=fun_delay(Y1,i-1).*(abs(fun_delay(Y1,i-1)).^(2*k-2));      
        end
    end
end
A1=(inv(U'*U)*U')*V1;
end