a = imread('woman.png');
img = im2double(a);

%导向滤波
p = img;
r = 4;
eps = 0.2^2;
Iguided = guidedfilter(img,p,r,eps);

H = im2double(Iguided) - img + 128;

G = imgaussfilt(H,2);

opacity = 50;
O = (img*(100 - opacity)+(img+2*G-256)*opacity)/100;

subplot(1,2,1),imshow(a),title('原图');
subplot(1,2,2),imshow(O),title('美颜后');