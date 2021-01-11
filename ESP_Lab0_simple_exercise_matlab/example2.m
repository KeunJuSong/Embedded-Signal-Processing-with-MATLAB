clear;
clc;

t = linspace(0,6,100);
y1 = exp(-t);
y2 = cos(pi*t);
y3 = y1 .* y2;

figure(1);

subplot(311)
plot(t,y1);
xlabel('t');
ylabel('y1');
grid on;

subplot(312)
plot(t,y2);
xlabel('t');
ylabel('y2');
grid on;

subplot(313)
plot(t,y3);
xlabel('t');
ylabel('y3');
ylim([-1 1]);
grid on;

