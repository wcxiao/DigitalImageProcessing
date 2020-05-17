function f = move2center(f,P,Q)
%move2center(f,P,Q) ³Ë(-1)^(x+y)
%   f: matrix
%   P: row number
%   Q: col number
for i=1:1:P
    for j=1:1:Q
        f(i,j)=((-1)^(i+j-2))*f(i,j);
    end
end
end

