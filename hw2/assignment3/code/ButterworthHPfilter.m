function B = ButterworthHPfilter(n,D0,P,Q)
%ButterworthHPfilter(n,D0,P,Q) Butterworth高通滤波器
%   n,D0: Butterworth滤波器参数
%   P: row number
%   Q: col number
B = zeros(P,Q);
for i=1:1:P
    for j=1:1:Q
        d=((i-P/2)^2+(j-Q/2)^2)^(0.5);
        B(i,j)=1/(1+(D0/d)^(2*n));
    end
end
end

