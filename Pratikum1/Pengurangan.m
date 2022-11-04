clear all;
P=imread('airmancur.jpeg');
figure(1), imshow(P);
Q=imread('menaraparis.jpeg');
figure(2), imshow(Q);
a = 0.5; b= 1-a;
[N, M, K] = size(P);
for n = 1 : N,
    for m = 1 : M,
        for k = 1 : K,
            Citra_sub(n,m,k) = abs(a*P(n,m,k) - b*Q(n,m,k));
        end
    end
end
figure(3), imshow(Citra_sub);
Citra_sub1 = abs(a*P - b*Q);
figure(4), imshow(Citra_sub1);
    