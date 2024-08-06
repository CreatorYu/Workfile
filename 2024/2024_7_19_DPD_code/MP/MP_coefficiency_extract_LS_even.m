%% ���������ļ������ʽ
function A = MP_coefficiency_extract_LS_even(V1,input,K,Q,Gain)
%   ������С���˷����в�����ȡ
Y1=input/Gain;                                                             %���������һ������
N_y=length(input);                                                          %��ȡѵ��ģ�������ź�Y1�ĳ��ȣ��Ա����Ʊ�����
N_x=((K+1)/2)*(Q+1);                                                        %��ΪKֻ��Ϊ������Q��ȡֵΪ0~Q��
U=zeros(N_y,N_x);                                                           %���ɾ���U
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
%������﷨��MATLAB�е�һ�ַ���ķ��������ڼ�����С���˽⣨Least Squares Solution����
A = U\V1;
%����д����MATLAB��һ�����ԣ���ʵ�����ڱ���ִ������С���˷��ļ��㣬������ʽ��д�����С���˵ľ��󷽳̵Ĵ��롣
end
