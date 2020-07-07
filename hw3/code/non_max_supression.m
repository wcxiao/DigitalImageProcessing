function out = non_max_supression(dir,mag)
%non_max_supression(dir,mag) 非最大抑制
%   此处显示详细说明
[m,n] = size(mag);

out = mag;
for i=1:1:m
    for j=1:1:n
        switch dir(i,j)
            case 1
                %垂直梯度
                if(i-1>=1)
                    out(i,j)=(mag(i,j)>=mag(i-1,j))*out(i,j);
                end
                if(i+1<=m)
                    out(i,j)=(mag(i,j)>=mag(i+1,j))*out(i,j);
                end
            case 2
                %+45度梯度方向(西北-东南方向)
                if(j-1>=1&&i-1>=1)
                    out(i,j)=(mag(i,j)>=mag(i-1,j-1))*out(i,j);
                end
                if((j+1) <= n && (i+1) <= m)
                    out(i,j)=(mag(i,j)>=mag(i+1,j+1))*out(i,j);
                end
            case 3
                %水平梯度方向
                if(j-1>=1)
                    out(i,j)=(mag(i,j)>=mag(i,j-1))*out(i,j);
                end
                if((j+1) <= n)
                    out(i,j)=(mag(i,j)>=mag(i,j+1))*out(i,j);
                end
            case 4
                %-45度梯度方向(东北-西南方向)
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

