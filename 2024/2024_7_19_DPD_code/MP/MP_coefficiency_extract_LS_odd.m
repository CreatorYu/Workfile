%% ����ż����ļ������ʽ
function A = MP_coefficiency_extract_LS_odd(V1,input,K,Q,Gain)
%   ������С���˷����в�����ȡ
Y1=input/Gain;                                                             %���������һ������
N_y=length(input);                                                          %��ȡѵ��ģ�������ź�Y1�ĳ��ȣ��Ա����Ʊ�����
N_x=K*(Q+1);
U=zeros(N_y,N_x);                                                           %���ɾ���U
for k=1:K
    for q=1:Q+1
        if k==1
            U(:,q)=fun_delay(Y1,q-1);
        else
            U(:,(k-1)*(Q+1)+q)=fun_delay(Y1,q-1).*((abs(fun_delay(Y1,q-1))).^(k-1));
        end
    end
end
%A=((U'*U)\U')*V1;                                                          %((U'*U)\U')*V1 ������һ��ͨ�õ���С���˷���ʽ������һ�־���������漰������˷�����������㣬ͨ�����ڽ�����󷽳̶����������������
A=U\V1;                                                                     %��С���˷���\�����ͨ�����ڽ�����Է����飬����С���˷���һ��Ӧ��
end

