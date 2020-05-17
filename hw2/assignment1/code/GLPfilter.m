function H = GLPfilter(D0,P,Q)
%GLPfilter 高斯低通滤波器
%   此处显示详细说明
H = zeros(P,Q);
for i=1:1:P
    for j=1:1:Q
        d=((i-P/2)^2+(j-Q/2)^2)^(0.5);
        H(i,j)=exp(-d^2/2/D0/D0);
    end
end
end

