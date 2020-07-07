function Out = mycorr2(A,B,shape)
%correlation 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n] = size(A);
[p,q] = size(B);

%paddedsize:
PM = m+2*(p-1);
PN = n+2*(q-1);

Cpadded = zeros(PM,PN);
C = zeros(PM,PN);
Cpadded(p:p+m-1,q:q+n-1) = A;

a = (p-1)/2;
b = (q-1)/2;
rstart = (p+1)/2;
rend = PM-a;
cstart = (q+1)/2;
cend = PN-b;

for i=rstart:1:rend
    for j=cstart:1:cend
        tmp = Cpadded(i-a:i+a,j-a:j+a).*B;
        C(i,j) = sum(sum(tmp));
    end
end

if strcmp(shape,'full')
    Out = C(rstart:rend,cstart:cend);
elseif strcmp(shape,'same')
    Out = C(p:PM-p+1,q:PN-q+1);
elseif strcmp(shape,'valid')
    rs = rstart + p-1;
    re = rend - (p-1);
    cs = cstart + q-1;
    ce = cend - (q-1);
    Out = C(rs:re,cs:ce);
end

end

