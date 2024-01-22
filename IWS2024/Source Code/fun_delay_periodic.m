%%  延时单元，构造非线性模块
function B= fun_delay_periodic(A,D)                                         %A表示需要进行延时的信号；D表示要延时的深度
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N=length(A);
if D==0
    B=A;
else  B(1:D)=A(N-D+1:end);                                                  %此延时操作就是将A末尾几位延时位移动到B的初始位置！！！
        B(D+1:N)=A(1:N-D);
end
end

