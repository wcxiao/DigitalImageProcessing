function C = myconv2(A,B,shape)
%myconv2 convolution of image-A and kernel-B
%   �˴���ʾ��ϸ˵��

Br = rot90(B,2);
C = mycorr2(A,Br,shape);

end

