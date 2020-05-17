a = imread('3_3.jpg');

[M,N] = size(a);
b = im2double(a);
P = 2*M;Q=2*N;

%傅里叶变换
F = fft2(b,P,Q);

%根据Sobel算子空间域生成频率域
%sobel算子
h = [[-1,0,1];[-2,0,2];[-1,0,1]]

%生成频率域阵列
hp = zeros(P,Q);
%将算子置于阵列中心,P=Q=1200
hp(600:602,600:602)=h;

% 乘(-1)^(x+y)中心化
% H = move2center(hp,P,Q);
H = hp;
%计算傅里叶变换
Hft = fft2(im2double(H),P,Q);

%将实部置为0
Hft_imag = imag(Hft);
newH = Hft_imag*i;

%乘(-1)^(x+y)
Hres = move2center(newH,P,Q);


% 频率域滤波
G = Hres.*F;

%反傅里叶变换
g = ifft2(G);

%裁剪
h = g(1:M,1:N);

subplot(2,2,1),imshow(log(abs(F)+1),[]),title('原图');
subplot(2,2,2),imshow(imag(Hres),[]),title('算子');
subplot(2,2,3),imshow(g,[]);
subplot(2,2,4),imshow(h,[]),title('结果');


