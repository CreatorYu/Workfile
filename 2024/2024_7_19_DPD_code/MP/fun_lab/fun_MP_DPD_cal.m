function V1 = fun_MP_DPD_cal(X1, A, K, Q)
%FUN_MP_EVEN_CAL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Nx=length(X1);
N1=(K+1)/2*(Q+1);                                                            
U=zeros(Nx,N1);                                                            %���ɾ��󣬴���ʽ(46)
for k=1:(K+1)/2                                                                   %T1�ڴ˴�Ϊʽ(27)�е�Q
    for i=1:Q+1                                                               %M1�ڴ˴�Ϊʽ(27)�е�K
        if k==1
            U(:,i)=fun_delay(X1,i-1);
        else
            U(:,(k-1)*(Q+1)+i)=fun_delay(X1,i-1).*(abs(fun_delay(X1,i-1)).^(2*k-2));      
        end
    end
end
V1=U*A;
end

