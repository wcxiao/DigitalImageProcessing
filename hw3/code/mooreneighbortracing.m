function boundary = mooreneighbortracing(binimg,pos)
%mooreneighbortracing(binimg,pos)
%   binimg: ����Ķ�ֵͼ
%   pos: ����λ��(x,y)��Ϊ��ʼ��,Ѱ�Ҹõ����ڱ�Ե
%   boundary: �����Ե���е�����꼯��

initial_entry = pos;

% ��X��Moore���򣬰�������˳����б���
% [ 2 ][ 3 ][ 4 ]
% [ 1 ][ X ][ 5 ]
% [ 8 ][ 7 ][ 6 ]
% �˸��ھӵ�����ƫ�ƣ�
neighborhood = [ 0 -1; -1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1 ];
exit_direction = [ 7 7 1 1 3 3 5 5 ];

% ����������������ҵ���һ��ֵΪ1�ĵ�
for n = 1 : 8 % 8-connected neighborhood
	c = initial_entry + neighborhood( n, : );
    if binimg( c( 1 ), c( 2 ) ) == 1
        initial_position = c;
        break;
    end
end

% �����ҵ��ĵ��λ�����ý���õ�ķ���
initial_direction = exit_direction( n );

% ��������λ�ü���߽缯��
boundary( 1, : ) = initial_position;

% ��ʼ��ѭ������
position = initial_position;
direction = initial_direction;
boundary_size = 1;

% ѭ������
while true

    % ˳ʱ�����
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

    % �����ҵ��ĵ����Ϣ���и���
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
