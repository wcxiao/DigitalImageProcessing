function edge = mycanny(img,n,delta,low,high)
%mycanny(gray,n,theta,low,high)
%   gray: 输入灰度图
%   n: 高斯滤波器大小
%   delta: 高斯滤波器标准差
%   low: 较小阈值
%   high: 较大阈值

if numel(size(img))==3
    gray = double(rgb2gray(img));
else
    gray = double(img);
end
gray = gray/255;
% figure(1),imshow(gray,[]),imwrite(gray,'./figures/gray.png');
subplot(3,3,1),imshow(gray,[]),title('灰度图');

%高斯模糊
G = GLPSpatialfilter(n,delta);
bluredgray = myconv2(gray,G,'same');
% figure(2),imshow(bluredgray,[]),imwrite(bluredgray,'./figures/bluredgray.png');
subplot(3,3,2),imshow(bluredgray,[]),title('高斯模糊后');

%计算梯度
[gx, gy, M, a]=gradSobel(bluredgray);
% figure(3),imshow(M),imwrite(M,'./figures/M.png');
subplot(3,3,3),imshow(M,[]),title('梯度的模');
% figure(4),imshow(a),imwrite(a,'./figures/a.png');
% subplot(3,3,4),imshow(a,[]);

%非最大抑制
%根据梯度方向角度设置方向
dir = setdirection(a);
Mag = non_max_supression(dir,M);
% figure(5),imshow(Mag),imwrite(Mag,'./figures/Mag.png');
subplot(3,3,4),imshow(Mag,[]),title('非最大抑制后');

%滞后阈值
%强边缘
g_NH=(Mag>=high);
g_NL=(Mag>=low);
%弱边缘
g_NL = g_NL-g_NH;
% figure(6),imshow(g_NH),imwrite(g_NH,'./figures/gNH.png');
subplot(3,3,5),imshow(g_NH,[]),title('强边缘');
% figure(7),imshow(g_NL),imwrite(g_NL,'./figures/gNL.png');
subplot(3,3,6),imshow(g_NL,[]),title('弱边缘');

%连通性分析
%八个邻居位置偏移量
neigh=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];
%padding
% gNHpad = padarray(g_NH,[1,1],'replicate');
% gNLpad = padarray(g_NL,[1,1],'replicate');
gNHpad = padarray(g_NH,[1,1]);
gNLpad = padarray(g_NL,[1,1]);
res = zeros(size(gNLpad));
%保留gNL中八连通的点，并将gNH和gNL合并到res中
for i=2:1:size(gNLpad,1)-1
    for j=2:1:size(gNLpad,2)-1
        if gNHpad(i,j)>0
            res(i,j)=gNHpad(i,j);
            %遍历当前点的八个邻居，将gNL中的非零值加入res
            for k=1:8
                if gNLpad(i+neigh(k,1),j+neigh(k,2))>0
                    res(i+neigh(k,1),j+neigh(k,2))=gNLpad(i+neigh(k,1),j+neigh(k,2));
                end
            end
        end
    end
end

edge = res(2:size(gNLpad,1)-1,2:size(gNLpad,2)-1);
subplot(3,3,7),imshow(edge,[]),title('结果');
end

