function dir = setdirection(a)
%setdirection(a): 根据角度矩阵a设置各个确定梯度方向
%1: 垂直梯度，水平边
%2: +45度梯度
%3: 水平梯度
%4: -45度梯度

dir1 = ((-22.5<=a&a<22.5)|(abs(a)>=157.5));
dir1 = dir1*1;

dir2 = ((-157.5<a&a<=-112.5)|(22.5<=a&a<67.5));
dir2 = dir2*2;

dir3 = ((-112.5<a&a<=-67.5)|(67.5<=a&a<112.5));
dir3 = dir3*3;

dir4 = ((-67.5<a&a<-22.5)|(112.5<=a&a<157.5));
dir4 = dir4*4;

dir = dir1+dir2+dir3+dir4;
end

