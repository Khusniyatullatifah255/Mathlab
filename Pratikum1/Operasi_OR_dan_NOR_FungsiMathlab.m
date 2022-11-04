P = imread('segitiga.jpeg');
P = im2bw(P,0.1);
figure(1), imshow(P,[]);
Q = imread('segitiga_kebalik.jpeg');
Q = im2bw(Q,0.1);
figure(2), imshow(Q,[]);
[N, M] = size(P);
for n = 1 : M
    for m = 1 : M
        Citra_or(n,m)= bitor (P(n,m), Q(n,m));
        Citra_nor(n,m)= ~bitor (P(n,m) , Q(n,m));
    end
end
figure(3), imshow(Citra_or);
Citra_and1 =  bitor(P,Q);
figure(4), imshow(Citra_and1);
figure(5), imshow(Citra_nor);
Citra_nand1 = ~bitor(P,Q);
figure(6), imshow(Citra_nand1);