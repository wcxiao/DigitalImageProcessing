function G = GLPSpatialfilter(n,delta)
%GLPSpatialfilter ��˹��ͨ�ռ��˲���
%   �˴���ʾ��ϸ˵��

k = (n-1)/2;
[x,y]=meshgrid(-k:k,-k:k);

G = exp(-(x.*x+y.*y)./(2*delta*delta));

G = G/sum(sum(G));

end

