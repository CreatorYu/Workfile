function V_out = DDRV_DPD_MODEL(X,K,Q,A,order)
%DDRV_DPD_MODEL 此处显示有关此函数的摘要
%   此处显示详细说明
N_y = length(X);
N_x1 = (1+(K-1)/2)*(Q+1);
N_x2 = Q*(K-1)/2;
X1 = zeros(N_y,N_x1);
X2 = zeros(N_y,N_x2);
if order == 1
    for k = 1:(K-1)/2+1
        for m =1:Q+1
            X1(:,m+(k-1)*(Q+1))=((abs(X)).^(2*(k-1))).*fun_delay(X,m-1);
        end
    end
    for k = 1:(K-1)/2
        for m = 1:Q
            X2(:,m+(k-1)*Q)=((abs(X)).^(2*(k-1))).*((X).^2).*conj(fun_delay(X,m));
        end
    end
    X3 = [X1 X2];
    V_out = X3*A;
else
    U1 = zeros(N_y,N_x1);
    for k = 1:(K-1)/2+1
        for m = 1:Q+1
            U1(:,(k-1)*(Q+1)+m)=((abs(X)).^(2*(k-1))).*fun_delay(X,m-1);
        end
    end
    U2 = zeros(N_y,N_x2);
    U3 = zeros(N_y,N_x2);
    U4 = zeros(N_y,N_x2);
    for k =1:(K-1)/2
        for m = 1:Q
            U2(:,m+(k-1)*Q)=((abs(X)).^(2*(k-1))).*((X).^2).*conj(fun_delay(X,m));
            U3(:,m+(k-1)*Q)=((abs(X)).^(2*(k-1))).*X.*(abs(fun_delay(X,m))).^2;
            U4(:,m+(k-1)*Q)=((abs(X)).^(2*(k-1))).*conj(X).*(fun_delay(X,m)).^2;
        end
    end
    U = [U1 U2 U3 U4];
    V_out = U*A;
end

