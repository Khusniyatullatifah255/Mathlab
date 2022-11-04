clear all;
P=imread('segitiga.jpeg');
figure(1), imshow(P, []);
Q=imread('segitiga_kebalik.jpeg');
figure(2), imshow (Q, []);
[N, M] = size(P);
for n = 1 : N,
    for m = 1 : M,
        citra_or (n,m)=P(n,m) | Q(n,m);
        citra_nor(n,m)=~(P(n,m) | Q(n,m));
    end
end
figure(3), imshow(citra_or);
figure(4), imshow(citra_nor);