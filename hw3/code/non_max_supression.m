function out = non_max_supression(dir,mag)
%non_max_supression(dir,mag) ���������
%   �˴���ʾ��ϸ˵��
[m,n] = size(mag);

out = mag;
for i=1:1:m
    for j=1:1:n
        switch dir(i,j)
            case 1
                %��ֱ�ݶ�
                if(i-1>=1)
                    out(i,j)=(mag(i,j)>=mag(i-1,j))*out(i,j);
                end
                if(i+1<=m)
                    out(i,j)=(mag(i,j)>=mag(i+1,j))*out(i,j);
                end
            case 2
                %+45���ݶȷ���(����-���Ϸ���)
                if(j-1>=1&&i-1>=1)
                    out(i,j)=(mag(i,j)>=mag(i-1,j-1))*out(i,j);
                end
                if((j+1) <= n && (i+1) <= m)
                    out(i,j)=(mag(i,j)>=mag(i+1,j+1))*out(i,j);
                end
            case 3
                %ˮƽ�ݶȷ���
                if(j-1>=1)
                    out(i,j)=(mag(i,j)>=mag(i,j-1))*out(i,j);
                end
                if((j+1) <= n)
                    out(i,j)=(mag(i,j)>=mag(i,j+1))*out(i,j);
                end
            case 4
                %-45���ݶȷ���(����-���Ϸ���)
                if(j+1<=n&&i-1>=1)
                    out(i,j)=(mag(i,j)>=mag(i-1,j+1))*out(i,j);
                end
                if((j-1) >= 1 && (i+1) <= m)
                    out(i,j)=(mag(i,j)>=mag(i+1,j-1))*out(i,j);
                end
        end
    end
end

end

