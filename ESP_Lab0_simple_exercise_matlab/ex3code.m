clear;
clc;

tau = 0.3;

x0 = linspace(0,1,1000);
y0 = zeros(1, length(x0));
y0 = (x0 <= x0(1) + tau) | (x0 >= x0(length(x0)) - tau);

x = linspace(0,2,2000);
y = repmat(y0,1,2);

f = 5;
y2 = zeros(1,length(x));
y2(find(y == 0)) = cos( 2*pi*f*x(find(y == 0)) );
y2(find(y == 1)) = cos( 2*pi*f*x(find(y == 1)) + pi );

subplot(2,1,1);
plot(x,y);
grid on;
xlabel('X');
ylabel('Y');
ylim([0 1.2]);

subplot(2,1,2);
plot(x, y2);
grid on;
xlabel('X');
ylabel('Y');
