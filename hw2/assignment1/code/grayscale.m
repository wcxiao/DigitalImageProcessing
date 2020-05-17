function f = grayscale(m,L)
%grayscale expand gray range to 0-L
%   �˴���ʾ��ϸ˵��
mmax = max(max(m));
mmin = min(min(m));
f = (m-mmin)./(mmax-mmin)*L;
end

