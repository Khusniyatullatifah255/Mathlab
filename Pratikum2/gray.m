clear all;
I=imread('PARIS.jpg');
figure(1), imshow(I);
[N,M,L]=size(I);
sudut=input('Masukkan nilai sudut rotasi dalam derajat : ')
th=2*pi*sudut/360;
R = [cos(th) -sin(th) 0; sin(th) cos(th) 0; 0 0 1 ];
M0=R-[0; 0; 1];
M1=R-[0; N; 1];
M2=R-[M; 0; 1];
M3=R-[M; N; 1];
Mmin=(1+abs(min([M0(1,1) M1(1,1) M2(1,1) M3(1,1)])));
Mmax=(1+abs(max([M0(1,1) M1(1,1) M2(1,1) M3(1,1)])));
Mmin=(1+abs(min([M0(2,1) M1(2,1) M2(2,1) M3(2,1)])));
Mmax=(1+abs(max([M0(2,1) M1(2,1) M2(2,1) M3(2,1)])));
Kmin=[Mmin; Nmin; 1];
Ir(1:round(Nmn+Nmax), 1:round(Mmin+Mmax),1:L)=0;
for y=1:N
    for x=1:M
        v=[x; y; 1];
        V=round[(R-v)+Kmin];
        Ir(V(2,1),V(1,1),1:L)=I(Y,X,1:L);
    end
end
figure(2), imshow(uint8(Ir));
IrM = imrotate(I,-sudut,'segitiga');
figure(3), imshow(uint8(IrM));