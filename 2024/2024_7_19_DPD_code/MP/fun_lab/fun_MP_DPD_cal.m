function V1 = fun_MP_DPD_cal(X1, A, K, Q)
%FUN_MP_EVEN_CAL 此处显示有关此函数的摘要
%   此处显示详细说明
Nx=length(X1);
N1=(K+1)/2*(Q+1);                                                            
U=zeros(Nx,N1);                                                            %生成矩阵，代替式(46)
for k=1:(K+1)/2                                                                   %T1在此处为式(27)中的Q
    for i=1:Q+1                                                               %M1在此处为式(27)中的K
        if k==1
            U(:,i)=fun_delay(X1,i-1);
        else
            U(:,(k-1)*(Q+1)+i)=fun_delay(X1,i-1).*(abs(fun_delay(X1,i-1)).^(2*k-2));      
        end
    end
end
V1=U*A;
end

