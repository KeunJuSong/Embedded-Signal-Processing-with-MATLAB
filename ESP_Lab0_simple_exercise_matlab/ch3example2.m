clear;
clc;

t = linspace(0, 2.5, 100);
f = 1;
y = cos( 2*pi*f*t );

y2 = times_two(y);

figure(1)
plot(t, y, t, y2, 'r-x');
grid on;
legend('Original signal', 'Modified signal');