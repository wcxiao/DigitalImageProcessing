a = imread('436.tif');
subplot(3,3,1),imshow(a);
[M,N] = size(a);
P = 2*M; Q=2*N;

%b
b = uint8(zeros(P,Q));
for i=1:1:M
    for j=1:1:N
        b(i,j)=a(i,j);
    end
end
subplot(3,3,2),imshow(b);

%c
c = move2center(b,P,Q);
subplot(3,3,3),imshow(c);

%d
dtmp = im2double(c);
ft = fft2(dtmp);

d = log(abs(ft)+1);
subplot(3,3,4),imshow(d,[]);

%e
e = GLPfilter(15,P,Q);
subplot(3,3,5),imshow(grayscale(e,255));

%f
f = e.*ft;
subplot(3,3,6),imshow(grayscale(f,255));

%g
g = move2center(real(ifft2(f)),P,Q);
g = grayscale(g,255);
subplot(3,3,7),imshow(uint8(g),[]);

%h
h = uint8(zeros(M,N));
for i=1:1:M
    for j=1:1:N
        h(i,j)=g(i,j);
    end
end
subplot(3,3,8),imshow(h);

