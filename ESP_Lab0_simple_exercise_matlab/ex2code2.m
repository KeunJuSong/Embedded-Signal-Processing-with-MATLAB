clear;
clc;

% for 문을 사용하지 않은 경우.

tau = 0.3;

x0 = linspace(0,1,1000);
y0 = zeros(1, length(x0));
y0 = (x0 <= x0(1) + tau) | (x0 >= x0(length(x0)) - tau);

x = linspace(0,5,5000);
y = repmat(y0,1,5);

plot(x,y);
grid on;
xlabel('X');
ylabel('Y');
ylim([0 1.2]);
