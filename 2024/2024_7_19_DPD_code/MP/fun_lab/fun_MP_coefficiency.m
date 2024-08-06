%% ������С���˷���ȡmemorypolynomialģ��Ԥʧ�����Ĳ���
function A1=fun_MP_coefficiency(Y1, V1, K, Q)
Nx=length(Y1);                                                              %Nx��ʾ�����źŵĳ���
N1=(K+1)/2*(Q+1);                                                           %N2=25
U=zeros(Nx,N1);                                                             %���ɾ��󣬴���ʽ(46)
for k=1:(K+1)/2                                                                   %T1�ڴ˴�Ϊʽ(27)�е�Q
    for i=1:Q+1                                                               %M1�ڴ˴�Ϊʽ(27)�е�K
        if k==1
            U(:,i)=fun_delay(Y1,i-1);
        else
            U(:,(k-1)*(Q+1)+i)=fun_delay(Y1,i-1).*(abs(fun_delay(Y1,i-1)).^(2*k-2));      
        end
    end
end
A1=(inv(U'*U)*U')*V1;
end