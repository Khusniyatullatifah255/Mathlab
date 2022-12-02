clear all;
I = imread('images.png');
I(1:10,1:10,1)
[N,M,L] = size(I);
LCH_Edge(1:300,1:300,1:3) = 128;
Th = 0.00885645;
MAT = [0.412453 0.357580 0.180423; 
       0.212671 0.715160 0.072169;
       0.019334 0.119193 0.950227];
for n = 1 : N
    for m = 1 : M
        b = double(I(n,m,3)); g = double(I(n,m,2)); r = double(I(n,m,1));
        RGB = [r/255; g/255; b/255];
        XYZ = MAT * RGB;
        X = XYZ (1,1) / 0.950456;
        Y = XYZ (2,1);
        Z = XYZ (3,1) / 1.088754;
        XT = X > Th;
        YT = Y > Th;
        ZT = Z > Th;
        fX = XT .* X.^(1/3) + (~XT).* (7.787 .* X + 16/116);
        fY = YT .* Y.^(1/3) + (~YT).* (7.787 .* Y + 16/116);
        fZ = ZT .* Z.^(1/3) + (~ZT).* (7.787 .* Z + 16/116);
        L = (116 * fY - 16.0);
        a1 = (500 * (fX - fY));
        b1 = (200 * (fY - fZ));
        C = sqrt ((a1*a1)+(b1*b1));
        H = atan2(b1,a1);
        j = 125 + round (C * cos (H));
        i = 200 - round (C * sin (H) + L);
    end;
end;
for b=0:255
    for g=0:255
        for r=0:255
            RGB = [r/255; g/255; b/255];
            XYZ = MAT * RGB;
            X = XYZ (1,1) / 0.950456;
            Y = XYZ (2,1);
            Z = XYZ (3,1) / 1.088754;
            XT = X > Th;
            YT = Y > Th;
            ZT = Z > Th;
            fX = XT .* X.^(1/3) + (~XT).* (7.787 .* X + 16/116);
            fY = YT .* Y.^(1/3) + (~YT).* (7.787 .* Y + 16/116);
            fZ = ZT .* Z.^(1/3) + (~ZT).* (7.787 .* Z + 16/116);
            L = (116 * fY - 16.0);
            a1 = (500 * (fX - fY));
            b1 = (200 * (fY - fZ));
            C = sqrt ((a1*a1)+(b1*b1));
            H = atan2(b1,a1);
            j = 125 + round (C * cos (H));
            i = 200 - round (C * sin (H) + L);
            if ((r == b && g == 255) || (r == g && b == 255) || ...
                    (r == b && g == 255)|| (r == 255 && g == 255) || ...
                    (g == 255 && b == 255) || (b == 255 && r == 255) || ...
                    (b == 0 && g == 0) || (r == 0 && g == 0) || ...
                    (b == 255 && r == 0) || (b == r && g == 0) || ...
                    (r == g && b == 0) || (b == g && r == 0) || ...
                    (b == 255 && r == 0) || (b == 255 && g == 0) || ...
                    (g == 255 && r == 0) || (g == 255 && b == 0) || ...
                    (r == 255 && b == 0) || (r == 255 && g == 0) || ...
                    (r == g && g == b))
                     LCH_Edge(i,j,1) = r;
                     LCH_Edge(i,j,2) = g;
                     LCH_Edge(i,j,3) = b;
            end;
        end;
    end;
end;
figure(2) , imshow(uint8(LCH_Edge));
imwrite(uint8(LCH_Edge), 'LCH_image1.png');