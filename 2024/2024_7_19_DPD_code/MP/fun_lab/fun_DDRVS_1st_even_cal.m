function V1=fun_DDRVS_1st_even_cal(X1, A, B, T1, M1)
j=sqrt(-1);
% Test_NL
% Static_NL_Order=5;  
% Dy_1st_Order=3; Dy_1st_M=3;
% Dy_2nd_Order=2; Dy_2nd_M=3;
% K=Static_NL_Order; 
% T1=Dy_1st_Order;   M1=Dy_1st_M;
% T2=Dy_2nd_Order; M2=Dy_2nd_M;
%
% load('PA_in_out.mat','X1','Y1');
Nx=length(X1);
%
% Calculate output from the given A B C and input
% Static Nonlinearity
Yt1=fun_NL_Even_cal(A,X1);
% 1st Dynamic
Yt2=zeros(Nx,1);
for t1=1:T1
    for i=1:M1
        if t1==1
            Yt2=B(t1,i)*fun_delay(X1,i)+Yt2;
        else
            temp1=B(2*t1-2,i).*fun_delay(X1,i).*(abs(X1).^(2*t1-2));
            temp2=B(2*t1-1,i).*X1.*X1.*conj(fun_delay(X1,i)).*(abs(X1).^(2*t1-4));
            Yt2=temp1+temp2+Yt2;
        end
    end
end
% 2nd Dynamic
% Yt3=zeros(Nx,1);
% for t2=1:T2
%     for i1=1:M2
%         for i2=i1:M2
%             if t2==1
%                 if i1==i2
%                    temp1=C(1,i1,i2).*X1.*(abs(fun_delay(X1,i1)).^2);
%                    temp2=C(2,i1,i2).*conj(X1).*(fun_delay(X1,i1).^2);
%                    Yt3=temp1+temp2+Yt3;
%                 else
%                    temp1=C(3,i1,i2).*X1.*fun_delay(X1,i1).*conj(fun_delay(X1,i2));
%                    temp2=C(4,i1,i2).*X1.*conj(fun_delay(X1,i1)).*fun_delay(X1,i2);
%                    temp3=C(5,i1,i2).*conj(X1).*fun_delay(X1,i1).*fun_delay(X1,i2);
%                    Yt3=temp1+temp2+temp3+Yt3;
%                 end
%             else
%                 if i1==i2
%                     temp1=C(7*t2-8,i1,i2).*conj(X1).*(fun_delay(X1,i1).^2).*(abs(X1).^(2*t2-2));
%                     temp2=C(7*t2-7,i1,i2).*X1.*(abs(fun_delay(X1,i1)).^2).*(abs(X1).^(2*t2-2));
%                     temp3=C(7*t2-6,i1,i2).*(X1.^3).*(conj(fun_delay(X1,i1)).^2).*(abs(X1).^(2*t2-4));
%                     Yt3=temp1+temp2+temp3+Yt3;
%                 else 
%                     temp1=C(7*t2-5,i1,i2).*X1.*fun_delay(X1,i1).*conj(fun_delay(X1,i2)).*(abs(X1).^(2*t2-2));
%                     temp2=C(7*t2-4,i1,i2).*X1.*conj(fun_delay(X1,i1)).*fun_delay(X1,i2).*(abs(X1).^(2*t2-2));
%                     temp3=C(7*t2-3,i1,i2).*conj(X1).*fun_delay(X1,i1).*fun_delay(X1,i2).*(abs(X1).^(2*t2-2));
%                     temp4=C(7*t2-2,i1,i2).*(X1.^3).*conj(fun_delay(X1,i1)).*conj(fun_delay(X1,i2)).*(abs(X1).^(2*t2-4));
%                     Yt3=temp1+temp2+temp3+temp4+Yt3;
%                 end
%             end
%         end
%     end
% end
% Yt=Yt1+Yt2+Yt3;
Yt=Yt1+Yt2;
V1=Yt;
end
                    
                    

% Ninput=length(PD_in1);
% PD_out=zeros(Ninput,1); PD_in=zeros(Ninput,1);
% PD_in(:)=PD_in1(:);
% PD_out(:)=PD_out1(:);
% K=NL_order;  Q=Memory_Length;  
% Ukq=zeros(Ninput,K*Q);
% for k=1:K
%      for q=1:Q
%           PD_inD=fun_delay(PD_in,q-1);
%           Bd=PD_inD.*(abs(PD_inD).^(2*k-2));
%           % Bd(q:Ninput,q,k)=PD_in(1:Ninput-q+1).*(abs(PD_in(1:Ninput-q+1)).^(2*k-2));
%           Ukq(:,K*(q-1)+k)=Bd;
%      end
% end
% % PD_out=Ukq*Akq;
% MP_coefficient=Ukq\PD_out;




