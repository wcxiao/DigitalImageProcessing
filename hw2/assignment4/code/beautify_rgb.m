a = imread('5.png');
ar = a(:,:,1);
ag = a(:,:,2);
ab = a(:,:,3);

I1 = im2double(ar);
I2 = im2double(ag);
I3 = im2double(ab);

p1 = I1;
p2 = I2;
p3 = I3;
r = 4;
eps = 0.2^2;
IG1 = guidedfilter(I1,p1,r,eps);
IG2 = guidedfilter(I2,p2,r,eps);
IG3 = guidedfilter(I3,p3,r,eps);

H1 = im2double(IG1) - I1 + 128;
H2 = im2double(IG2) - I2 + 128;
H3 = im2double(IG3) - I3 + 128;

G1 = imgaussfilt(H1,2);
G2 = imgaussfilt(H2,2);
G3 = imgaussfilt(H3,2);
opacity = 50;

O1 = (I1*(100 - opacity)+(I1+2*G1-256)*opacity)/100;
O2 = (I2*(100 - opacity)+(I2+2*G2-256)*opacity)/100;
O3 = (I3*(100 - opacity)+(I3+2*G3-256)*opacity)/100;

O(:,:,1) = O1;
O(:,:,2) = O2;
O(:,:,3) = O3;

subplot(1,2,1),imshow(a),title('‘≠Õº');
subplot(1,2,2),imshow(O),title('√¿—’∫Û');