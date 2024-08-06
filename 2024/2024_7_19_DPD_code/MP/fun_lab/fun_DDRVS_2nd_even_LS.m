function [A,B,C]=fun_DDRVS_2nd_even_LS(X1, Y1, K, T1, T2, M1, M2)
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
% Calculate A B C from the given input and output by LS
U1=zeros(Nx,K);
for i=1:K
    U1(:,i)=X1.*(abs(X1).^(i-1));
end
%
N2=(2*T1-1)*M1;
U2=zeros(Nx,N2);
for t1=1:T1
    for i=1:M1
        if t1==1
            U2(:,i)=fun_delay(X1,i);
        else
            U2(:,(2*t1-3)*M1+i)=fun_delay(X1,i).*(abs(X1).^(2*t1-2));
            U2(:,(2*t1-2)*M1+i)=X1.*X1.*conj(fun_delay(X1,i)).*(abs(X1).^(2*t1-4));            
        end
    end
end
%
N3=2*M2+M2*(M2-1)/2*3+(T2-1)*(3*M2+2*M2*(M2-1));
U3=zeros(Nx,N3);
Ind=zeros(M2,M2);
% Yt3=zeros(Nx,1);
for t2=1:T2
    for i1=1:M2
        for i2=i1:M2
            Ind(i1,i2)=(2*M2-i1)*(i1-1)/2+i2-i1;
            if t2==1
                if i1==i2
                    Ind1=2*i1-1;
                    Ind2=2*i1;
                    U3(:,Ind1)=X1.*(abs(fun_delay(X1,i1)).^2);
                    U3(:,Ind2)=conj(X1).*(fun_delay(X1,i1).^2);
                else
                    Ind1=2*M2+3*((2*M2-i1)*(i1-1)/2+i2-i1)-2;
                    Ind2=2*M2+3*((2*M2-i1)*(i1-1)/2+i2-i1)-1;
                    Ind3=2*M2+3*((2*M2-i1)*(i1-1)/2+i2-i1);
                    U3(:,Ind1)=X1.*fun_delay(X1,i1).*conj(fun_delay(X1,i2));
                    U3(:,Ind2)=X1.*conj(fun_delay(X1,i1)).*fun_delay(X1,i2);
                    U3(:,Ind3)=conj(X1).*fun_delay(X1,i1).*fun_delay(X1,i2);
                end
            else
                if i1==i2
                    Ind1=2*M2+3*M2*(M2-1)/2+(t2-2)*(3*M2+2*M2*(M2-1))+3*i1-2;
                    Ind2=2*M2+3*M2*(M2-1)/2+(t2-2)*(3*M2+2*M2*(M2-1))+3*i1-1;
                    Ind3=2*M2+3*M2*(M2-1)/2+(t2-2)*(3*M2+2*M2*(M2-1))+3*i1;
                    U3(:,Ind1)=conj(X1).*(fun_delay(X1,i1).^2).*(abs(X1).^(2*t2-2));
                    U3(:,Ind2)=X1.*(abs(fun_delay(X1,i1)).^2).*(abs(X1).^(2*t2-2));
                    U3(:,Ind3)=(X1.^3).*(conj(fun_delay(X1,i1)).^2).*(abs(X1).^(2*t2-4));
                else 
                    Ind1=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1)-3;
                    Ind2=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1)-2;
                    Ind3=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1)-1;
                    Ind4=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1);
                    U3(:,Ind1)=X1.*fun_delay(X1,i1).*conj(fun_delay(X1,i2)).*(abs(X1).^(2*t2-2));
                    U3(:,Ind2)=X1.*conj(fun_delay(X1,i1)).*fun_delay(X1,i2).*(abs(X1).^(2*t2-2));
                    U3(:,Ind3)=conj(X1).*fun_delay(X1,i1).*fun_delay(X1,i2).*(abs(X1).^(2*t2-2));
                    U3(:,Ind4)=(X1.^3).*conj(fun_delay(X1,i1)).*conj(fun_delay(X1,i2)).*(abs(X1).^(2*t2-4));
                end
            end
        end
    end
end
U=[U1 U2 U3];
coefficient=U\Y1; Au=coefficient;
Au1=Au(1:K);
Au2=Au(K+1:K+N2);
Au3=Au(K+N2+1:end);
%
A=Au1;
B=zeros(2*T1-1,M1);
C=zeros(7*T2-2,M2,M2);
for t1=1:T1
    for i=1:M1
        if t1==1
            B(t1,i)=Au2(i);
        else
            B(2*t1-2,i)=Au2((2*t1-3)*M1+i);       
            B(2*t1-1,i)=Au2((2*t1-2)*M1+i);  
        end
    end
end
%
for t2=1:T2
    for i1=1:M2
        for i2=i1:M2
            if t2==1
                if i1==i2
                    Ind1=2*i1-1;
                    Ind2=2*i1;
                    C(1,i1,i2)=Au3(Ind1);
                    C(2,i1,i2)=Au3(Ind2);
                else
                    Ind1=2*M2+3*((2*M2-i1)*(i1-1)/2+i2-i1)-2;
                    Ind2=2*M2+3*((2*M2-i1)*(i1-1)/2+i2-i1)-1;
                    Ind3=2*M2+3*((2*M2-i1)*(i1-1)/2+i2-i1);
                    C(3,i1,i2)=Au3(Ind1);
                    C(4,i1,i2)=Au3(Ind2);
                    C(5,i1,i2)=Au3(Ind3);
                end
            else
                if i1==i2
                    Ind1=2*M2+3*M2*(M2-1)/2+(t2-2)*(3*M2+2*M2*(M2-1))+3*i1-2;
                    Ind2=2*M2+3*M2*(M2-1)/2+(t2-2)*(3*M2+2*M2*(M2-1))+3*i1-1;
                    Ind3=2*M2+3*M2*(M2-1)/2+(t2-2)*(3*M2+2*M2*(M2-1))+3*i1;
                    C(7*t2-8,i1,i2)=Au3(Ind1);
                    C(7*t2-7,i1,i2)=Au3(Ind2);
                    C(7*t2-6,i1,i2)=Au3(Ind3);
                else 
                    Ind1=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1)-3;
                    Ind2=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1)-2;
                    Ind3=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1)-1;
                    Ind4=2*M2+3*M2*(M2-1)/2+(t2-1)*3*M2+(t2-2)*2*M2*(M2-1)+4*((2*M2-i1)*(i1-1)/2+i2-i1);
                    C(7*t2-5,i1,i2)=Au3(Ind1);
                    C(7*t2-4,i1,i2)=Au3(Ind2);
                    C(7*t2-3,i1,i2)=Au3(Ind3);
                    C(7*t2-2,i1,i2)=Au3(Ind4);
                end
            end
        end
    end
end
% for i=1:12
% Ctest(:,:,i)=C(i,:,:);
% end
end






