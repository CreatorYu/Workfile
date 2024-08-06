function coefficiency = DDRV_DPD_LS(V,Y,K,Q,G,order)
%K=15表示DDRV的非线性阶数，M=3表示模型的记忆深度，G为PA的平均功率增益
%   此处显示详细说明
Gain=10^(G/20);
Y=Y./Gain;
N_y = length(Y);
N_x1 = (Q+1)*((K-1)/2+1);
N_x2 = Q*(K-1)/2;
if order == 1
    U1 = zeros(N_y,N_x1);
    for k = 1:(K-1)/2+1
        for m = 1:Q+1
            U1(:,(k-1)*(Q+1)+m)=((abs(Y)).^(2*(k-1))).*fun_delay(Y,m-1);
        end
    end
    U2 =zeros(N_y,N_x2);
    for k = 1:(K-1)/2
        for m = 1:Q
            U2(:,(k-1)*Q+m)=((abs(Y)).^(2*(k-1))).*((Y).^2).*conj(fun_delay(Y,m));
        end
    end
    U = [U1 U2];
    coefficiency = U\V;
else
    U1 = zeros(N_y,N_x1);
    for k = 1:(K-1)/2+1
        for m = 1:Q+1
            U1(:,(k-1)*(Q+1)+m)=((abs(Y)).^(2*(k-1))).*fun_delay(Y,m-1);
        end
    end
    U2 = zeros(N_y,N_x2);
    U3 = zeros(N_y,N_x2);
    U4 = zeros(N_y,N_x2);
    for k =1:(K-1)/2
        for m = 1:Q
            U2(:,m+(k-1)*Q)=((abs(Y)).^(2*(k-1))).*((Y).^2).*conj(fun_delay(Y,m));
            U3(:,m+(k-1)*Q)=((abs(Y)).^(2*(k-1))).*Y.*(abs(fun_delay(Y,m))).^2;
            U4(:,m+(k-1)*Q)=((abs(Y)).^(2*(k-1))).*conj(Y).*(fun_delay(Y,m)).^2;
        end
    end
    U = [U1 U2 U3 U4];
    coefficiency = U\V;
end
end

