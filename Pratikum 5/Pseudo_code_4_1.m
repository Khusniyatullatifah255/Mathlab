clear all;
Im = double(imread('ImageEdgeGray.png')); %baca citra gray-level
figure(1), imshow(uint8(Im)); %tampilkan citra gray-level
[N,M] = size(Im);

for n = 1 : N - 1
    for m = 1 : M - 1
        Gy(n,m) = abs (Im(n + 1 , m) - Im(n,m));
        Gx(n,m) = abs (Im(n + 1 , m) - Im(n,m));
        G (n,m) = sqrt(Gx(n,m) ^ 2 + Gy(n,m)^2);
    end;
end;
figure(2), imshow(uint8(Gx));
figure(3), imshow(uint8(Gy));
figure(4), imshow(uint8(G));
[Gx1,Gy1] = gradient(Im);
G1 = abs(Gx1) + abs(Gy1);
figure(5), imshow(uint8(G1));