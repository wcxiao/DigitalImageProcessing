function C = myconv2(A,B,shape)
%myconv2 convolution of image-A and kernel-B
%   此处显示详细说明

Br = rot90(B,2);
C = mycorr2(A,Br,shape);

end

