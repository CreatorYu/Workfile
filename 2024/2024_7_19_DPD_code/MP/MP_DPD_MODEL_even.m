function V2 = MP_DPD_MODEL_even(X1,coefficiency_A,K,Q)
%MP_DPD_MODEL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
N_y=length(X1);                                                          %��ȡѵ��ģ�������ź�Y1�ĳ��ȣ��Ա����Ʊ�����
N_x=((K+1)/2)*(Q+1);                                                        %��ΪKֻ��Ϊ������Q��ȡֵΪ0~Q��
U=zeros(N_y,N_x);                                                            %���ɾ���U
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


