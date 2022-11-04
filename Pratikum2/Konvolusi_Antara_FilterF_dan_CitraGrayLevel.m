clear all;
K = 3;                    %set ukuran
F = ones(K,K)/(K*K);    %set matriks filters rata-rata F KxK
K1 = (K+1)/2;      
I = imread('jeruk.jpg');
figure(1), imshow(I);
[N,M,L] = size (I);
Citra = zeros (N+K-1, M+K-1, L);
Citra (K1:N+K1-1, K1:M+K1-1, :)=I(:,:,:)
for p =1:L
    for n = K1 : N+K1-1
        for m = K1 : M+K1-1
            konv = 0;
           for I = 1 : K
                for k = 1 : K
                    konv = konv +(F(1,k) * Citra(n+1-K1, m+k-K1,p));
                end
           end
           Citra_konv(n-K1+1, m-K1+1, p) = konv;
        end
    end
end
figure(2), imshow(uint8(Citra_konv));

                    