function G = GLPSpatialfilter(n,delta)
%GLPSpatialfilter 高斯低通空间滤波器
%   此处显示详细说明

k = (n-1)/2;
[x,y]=meshgrid(-k:k,-k:k);

G = exp(-(x.*x+y.*y)./(2*delta*delta));

G = G/sum(sum(G));

end

