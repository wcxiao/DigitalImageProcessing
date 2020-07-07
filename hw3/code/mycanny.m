function edge = mycanny(img,n,delta,low,high)
%mycanny(gray,n,theta,low,high)
%   gray: ����Ҷ�ͼ
%   n: ��˹�˲�����С
%   delta: ��˹�˲�����׼��
%   low: ��С��ֵ
%   high: �ϴ���ֵ

if numel(size(img))==3
    gray = double(rgb2gray(img));
else
    gray = double(img);
end
gray = gray/255;
% figure(1),imshow(gray,[]),imwrite(gray,'./figures/gray.png');
subplot(3,3,1),imshow(gray,[]),title('�Ҷ�ͼ');

%��˹ģ��
G = GLPSpatialfilter(n,delta);
bluredgray = myconv2(gray,G,'same');
% figure(2),imshow(bluredgray,[]),imwrite(bluredgray,'./figures/bluredgray.png');
subplot(3,3,2),imshow(bluredgray,[]),title('��˹ģ����');

%�����ݶ�
[gx, gy, M, a]=gradSobel(bluredgray);
% figure(3),imshow(M),imwrite(M,'./figures/M.png');
subplot(3,3,3),imshow(M,[]),title('�ݶȵ�ģ');
% figure(4),imshow(a),imwrite(a,'./figures/a.png');
% subplot(3,3,4),imshow(a,[]);

%���������
%�����ݶȷ���Ƕ����÷���
dir = setdirection(a);
Mag = non_max_supression(dir,M);
% figure(5),imshow(Mag),imwrite(Mag,'./figures/Mag.png');
subplot(3,3,4),imshow(Mag,[]),title('��������ƺ�');

%�ͺ���ֵ
%ǿ��Ե
g_NH=(Mag>=high);
g_NL=(Mag>=low);
%����Ե
g_NL = g_NL-g_NH;
% figure(6),imshow(g_NH),imwrite(g_NH,'./figures/gNH.png');
subplot(3,3,5),imshow(g_NH,[]),title('ǿ��Ե');
% figure(7),imshow(g_NL),imwrite(g_NL,'./figures/gNL.png');
subplot(3,3,6),imshow(g_NL,[]),title('����Ե');

%��ͨ�Է���
%�˸��ھ�λ��ƫ����
neigh=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];
%padding
% gNHpad = padarray(g_NH,[1,1],'replicate');
% gNLpad = padarray(g_NL,[1,1],'replicate');
gNHpad = padarray(g_NH,[1,1]);
gNLpad = padarray(g_NL,[1,1]);
res = zeros(size(gNLpad));
%����gNL�а���ͨ�ĵ㣬����gNH��gNL�ϲ���res��
for i=2:1:size(gNLpad,1)-1
    for j=2:1:size(gNLpad,2)-1
        if gNHpad(i,j)>0
            res(i,j)=gNHpad(i,j);
            %������ǰ��İ˸��ھӣ���gNL�еķ���ֵ����res
            for k=1:8
                if gNLpad(i+neigh(k,1),j+neigh(k,2))>0
                    res(i+neigh(k,1),j+neigh(k,2))=gNLpad(i+neigh(k,1),j+neigh(k,2));
                end
            end
        end
    end
end

edge = res(2:size(gNLpad,1)-1,2:size(gNLpad,2)-1);
subplot(3,3,7),imshow(edge,[]),title('���');
end

