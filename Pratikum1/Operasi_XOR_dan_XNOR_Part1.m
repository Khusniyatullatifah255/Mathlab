clear all;
P = imread('segitiga.jpeg');
figure(1), imshow(P, []);
Q = imread ('segitiga_kebalik.jpeg');
figure(2) , imshow(Q, []);
[N, M] = size(P);
for n = 1 : N,
    for m = 1 : M,
        Citra_or(n,m) = xor(P(n,m), Q(n,m));
        Citra_nor(n,m) = ~(xor(P(n,m), Q(n,m)));
    end
end
figure(3), imshow(Citra_or);
figure(4), imshow(Citra_nor);