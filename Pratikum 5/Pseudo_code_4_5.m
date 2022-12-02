clear all;
Im = double(imread('ImageEdgeGray.png')); %baca citra gray-level
figure(1), imshow(uint8(Im)); %tampilkan citra gray-level
[N,M] = size(Im);

L1 = [0,1,0;1,-4,1;0,1,0];
L2 = [1,1,1;1,-8,1;1,1,1];
L3 = [1,2,1;2,-12,2;1,2,1];
Ls1 = abs(conv2(Im,L1,'same'));
Ls2 = abs(conv2(Im,L2,'same'));
Ls3 = abs(conv2(Im,L3,'same'));
figure(2), imshow(uint8(Ls1));
figure(3), imshow(uint8(Ls2));
figure(4), imshow(uint8(Ls3));