function f = grayscale(m,L)
%grayscale expand gray range to 0-L
%   此处显示详细说明
mmax = max(max(m));
mmin = min(min(m));
f = (m-mmin)./(mmax-mmin)*L;
end

