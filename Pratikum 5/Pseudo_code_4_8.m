clear all;
I = imread('Noisegray50%Gaussian.png');

s = input('Masukan nilai standar deviasi : ');
A = (1/(2*pi*s^2));
C = (2*s^2)
for i = 1 : 7
    for j = 1 : 7
        D = - ((i-6)^2 + (j-6)^2) / C;
        b(i,j) = double(A*(1+D) * exp(D));
    end
end

Iprim = abs(conv2(double(I),b,'same'));
figure(1) , imshow(I);
figure(2), imshow(uint8(Iprim));