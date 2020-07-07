function boundary = mooreneighbortracing(binimg,pos)
%mooreneighbortracing(binimg,pos)
%   binimg: 输入的二值图
%   pos: 给定位置(x,y)作为起始点,寻找该点所在边缘
%   boundary: 输出边缘所有点的坐标集合

initial_entry = pos;

% 点X的Moore邻域，按照数字顺序进行遍历
% [ 2 ][ 3 ][ 4 ]
% [ 1 ][ X ][ 5 ]
% [ 8 ][ 7 ][ 6 ]
% 八个邻居的坐标偏移：
neighborhood = [ 0 -1; -1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1 ];
exit_direction = [ 7 7 1 1 3 3 5 5 ];

% 遍历给定点的邻域，找到第一个值为1的点
for n = 1 : 8 % 8-connected neighborhood
	c = initial_entry + neighborhood( n, : );
    if binimg( c( 1 ), c( 2 ) ) == 1
        initial_position = c;
        break;
    end
end

% 基于找到的点的位置设置进入该点的方向
initial_direction = exit_direction( n );

% 将这个点的位置加入边界集合
boundary( 1, : ) = initial_position;

% 初始化循环变量
position = initial_position;
direction = initial_direction;
boundary_size = 1;

% 循环查找
while true

    % 顺时针查找
    for i=1:8
        n = mod(direction + i - 1, 8);
        if n==0
            n = 8;
        end
        c = position + neighborhood(n,:);
        if binimg(c(1),c(2))==1
            position = c;
            break;
        end
    end

    % 根据找到的点的信息进行更新
    direction = exit_direction( n );
    boundary_size = boundary_size + 1;
    boundary( boundary_size, : ) = position;

    % Jacob's stopping criterion
    if all( position == initial_position ) &&...
    ( direction == initial_direction )
    	break;
    end
end

end
