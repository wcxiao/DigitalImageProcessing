function [gx, gy, M, a] = gradSobel(img)
%gradSobel(img) 使用Sobel算子计算img的梯度
%   此处显示详细说明

sobelx = [-1 -2 -1; 0 0 0; 1 2 1]
sobely = [-1 0 1; -2 0 2; -1 0 1]

gx = mycorr2(img,sobelx,'same');
gy = mycorr2(img,sobely,'same');

M = sqrt(gx.*gx+gy.*gy);
a = atan2d(gy,gx);

% S_x=fspecial('sobel');
% f_sobel_x=imfilter(img,S_x,'replicate');
% S_y=S_x';
% f_sobel_y=imfilter(img,S_y,'replicate');
% M=sqrt(f_sobel_x.^2+f_sobel_y.^2);
% a=atan2d(f_sobel_y,f_sobel_x);
% gx=f_sobel_x;
% gy=f_sobel_y;

end

