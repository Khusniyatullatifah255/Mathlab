clear all;
CMY_solid(1:425,1:425,1:3)= 128;
CMY_Edge(1:425,1:425,1:3)= 128;
Imax = 255; sudut = -5 * pi / 6;
for b = 0 : Imax
    for g = 0 : Imax
        for r = 0 : Imax;
            j = 150 + floor(g + (b * sin(-5 * pi / 6)));
            i = 280 - floor(b*sin(-5 * pi / 6) + r);
            CMY_solid(i,j,1) = Imax - r;
            CMY_solid(i,j,2) = Imax - g;
            CMY_solid(i,j,3) = Imax - b;
        
         if ((r == b && g == Imax) || (r == g && b == Imax) || ...
                 (r == b && g == Imax)|| (r == Imax && g == Imax) || ...
                 (g == Imax && b == Imax) || (b == Imax && r == Imax) || ...
                 (b == 0 && g == 0) || (r == 0 && g == 0) || ...
                 (b == Imax && r == 0) || (b == r && g == 0) || ...
                 (r == g && b == 0) || (b == g && r == 0) || ...
                 (b == Imax && r == 0) || (b == Imax && g == 0) || ...
                 (g == Imax && r == 0) || (g == Imax && b == 0) || ...
                 (r == Imax && b == 0) || (r == Imax && g == 0) || ...
                 (r == g && g == b))
               CMY_Edge(i,j,1) = Imax - r;
               CMY_Edge(i,j,2) = Imax - g;
               CMY_Edge(i,j,3) = Imax - b;
            end
        end;
    end;
end;
figure(1), imshow(uint8(CMY_solid));
figure(2), imshow(uint8(CMY_Edge));