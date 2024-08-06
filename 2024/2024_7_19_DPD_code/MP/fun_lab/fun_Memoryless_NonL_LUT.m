%% 模拟静态非线性系统
function Y2= fun_Memoryless_NonL_LUT(Plow, Pinm_dB, Num_section, Gstatic, X1)
% Gstatic表示静态增益
NF=length(X1);                                                              %计算模块输入信号的长度
Pin=abs(X1).^2;  Pin_dB=10*log10(Pin); % Pinm_dB=max(Pin_dB);               %计算模块输入信号的功率（dB）
% Plow=-30; Num_section=512; 
Punit=-Plow/Num_section;                                                    %表示将Plow划分为1024个小单元P_unit
T=floor((Pin_dB-Pinm_dB-Plow)/Punit+1);                                     %floor表示取整，即向下取整
for i=1:NF
    if T(i)<2
        Y2(i)=X1(i)*Gstatic(1);
    elseif T(i)>Num_section
        Y2(i)=X1(i)*Gstatic(end);
    else
        Y2(i)=X1(i)*Gstatic(T(i));
    end
end
Y2=conj(Y2');                                                               %得到Y2'中每个元素的复共轭
end