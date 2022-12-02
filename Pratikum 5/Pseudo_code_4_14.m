clear all;
I = double(imread('Noisegray50%Gaussian.png'));
B = [1 1 1; 1 1 1; 1 1 1];
Close = imclose(I,B);
Open = imopen(Close,B);
figure(1) , imshow(uint8(I));
figure(2), imshow(uint8(Open));