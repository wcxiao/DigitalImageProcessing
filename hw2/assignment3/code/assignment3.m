a = imread('455.png');

img = rgb2gray(a);
[M,N] = size(img);
P = 2*M; Q=2*N;

%Ìî³ä0
b = uint8(zeros(P,Q));
b(1:M,1:N)=img;

filter = @ButterworthHPfilter;
%¸µÀïÒ¶±ä»»
dtmp = im2double(b);
ft = fftshift(fft2(dtmp));
d = log(abs(ft)+1);

%ÂË²¨Æ÷,ÂË²¨
e = filter(2,10,P,Q);
e2 = filter(2,30,P,Q);
e3 = filter(2,60,P,Q);
e4 = filter(2,80,P,Q);

f = e.*ft;
f2 = e2.*ft;
f3 = e3.*ft;
f4 = e4.*ft;

%·´¸µÀïÒ¶±ä»»
g = real(ifft2(ifftshift(f)));
g2 = real(ifft2(ifftshift(f2)));
g3 = real(ifft2(ifftshift(f3)));
g4 = real(ifft2(ifftshift(f4)));

%²Ã¼ô
h = g(1:M,1:N);
h2 = g2(1:M,1:N);
h3 = g3(1:M,1:N);
h4 = g4(1:M,1:N);

subplot(2,2,1),imshow(h),title('n=2,D0=10');
subplot(2,2,2),imshow(h2),title('n=2,D0=30');
subplot(2,2,3),imshow(h3),title('n=2,D0=60');
subplot(2,2,4),imshow(h4),title('n=2,D0=80');

% subplot(2,2,1),imshow(e),title('n=2,D0=10');
% subplot(2,2,2),imshow(e2),title('n=2,D0=30');
% subplot(2,2,3),imshow(e3),title('n=2,D0=60');
% subplot(2,2,4),imshow(e4),title('n=2,D0=80');
