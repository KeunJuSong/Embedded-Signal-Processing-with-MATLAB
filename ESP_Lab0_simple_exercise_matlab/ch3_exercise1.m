clear;
clc;

[x1, y1] = make_circle( 0, 0, 1 );
[x2, y2] = make_circle( 0, 1, 3 );
[x3, y3] = make_circle( -1, 2, 2 );
[x4, y4] = make_circle( 2, 2, 1.5 );

figure(1)
plot( x1, y1, x2, y2, x3, y3, x4, y4 );
grid on;