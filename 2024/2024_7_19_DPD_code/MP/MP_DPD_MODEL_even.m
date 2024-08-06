function V2 = MP_DPD_MODEL_even(X1,coefficiency_A,K,Q)
%MP_DPD_MODEL 此处显示有关此函数的摘要
%   此处显示详细说明
N_y=length(X1);                                                          %获取训练模块输入信号Y1的长度，以便于制备矩阵
N_x=((K+1)/2)*(Q+1);                                                        %因为K只能为奇数，Q的取值为0~Q；
U=zeros(N_y,N_x);                                                            %生成矩阵U
for k=1:(K+1)/2
    for q=1:Q+1
        if k==1
            U(:,q)=fun_delay(X1,q-1);
        else
            U(:,(k-1)*(Q+1)+q)=fun_delay(X1,q-1).*((abs(fun_delay(X1,q-1))).^(2*k-2));
        end
    end
end
V2=U*coefficiency_A;
end


