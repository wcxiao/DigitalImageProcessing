a = imread('3_3.jpg');

%SobelËã×Ó£º
h = [[-1,0,1];[-2,0,2];[-1,0,1]]

%padding:
b = zeros(602,602);
b(2:601,2:601)=a;

c = zeros(602,602);

for i=2:1:601
    for j=2:1:601
        tmp = b(i-1:i+1,j-1:j+1).*h;
        c(i,j)=sum(sum(tmp));
    end
end

res = c(2:601,2:601);

imshow(res,[]);
