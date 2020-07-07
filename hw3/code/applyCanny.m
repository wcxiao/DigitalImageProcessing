% img = imread('lenna.png');
% img = imread('images/disk.jpg');
% img = imread('images/giraffe.jpg');
% img = imread('images/plane.jpg');
% img = imread('images/rubberband_cap.png');
% img = imread('images/castle.jpg');
img = imread('images/leaf.jpg');

% edge = mycanny(img,13,2,0.4,0.5);
edge = mycanny(img,13,2,0.04,0.1);

% figure(8),imshow(edge),imwrite(edge,'./figures/edge.png');
% subplot(3,3,5),imshow(g_NH,[]);
figure(2),imshow(edge);
% figure(2),imtool(edge);