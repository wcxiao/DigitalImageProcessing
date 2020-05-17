a = imread('3_3.jpg');

[M,N] = size(a);
b = im2double(a);
P = 2*M;Q=2*N;

%����Ҷ�任
F = fft2(b,P,Q);

%����Sobel���ӿռ�������Ƶ����
%sobel����
h = [[-1,0,1];[-2,0,2];[-1,0,1]]

%����Ƶ��������
hp = zeros(P,Q);
%������������������,P=Q=1200
hp(600:602,600:602)=h;

% ��(-1)^(x+y)���Ļ�
% H = move2center(hp,P,Q);
H = hp;
%���㸵��Ҷ�任
Hft = fft2(im2double(H),P,Q);

%��ʵ����Ϊ0
Hft_imag = imag(Hft);
newH = Hft_imag*i;

%��(-1)^(x+y)
Hres = move2center(newH,P,Q);


% Ƶ�����˲�
G = Hres.*F;

%������Ҷ�任
g = ifft2(G);

%�ü�
h = g(1:M,1:N);

subplot(2,2,1),imshow(log(abs(F)+1),[]),title('ԭͼ');
subplot(2,2,2),imshow(imag(Hres),[]),title('����');
subplot(2,2,3),imshow(g,[]);
subplot(2,2,4),imshow(h,[]),title('���');


