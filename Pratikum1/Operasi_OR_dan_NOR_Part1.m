clear;
P = imread('segitiga.jpeg');
P = im2bw(P,0.1);
figure(1), imshow(P,[]);
Q = imread('segitiga_kebalik.jpeg');
Q = im2bw(Q,0.1);
figure(2), imshow(Q,[]);
[N, M] = size(P);
for n = 1 : M
    for m = 1 : M
        if(P(n,m) == 1 || Q(n,m) == 1)
            Citra_or(n,m)=1;
        else Citra_or(n,m)=0;
        end
        if(P(n,m) == 1 || Q(n,m) == 1)
            Citra_nor(n,m)=0;
        else Citra_nor(n,m)=1;
        end
    end
end
figure(3), imshow(Citra_or);
figure(4), imshow(Citra_nor);