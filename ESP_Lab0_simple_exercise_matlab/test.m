clear;
clc;

t = linspace(0,2,100);

f1 = 1;
f2 = 3;
f3 = 5;

y1 = cos(2*pi*f1*t);
y2 = cos(2*pi*f2*t);
y3 = cos(2*pi*f3*t);
y4 = y1 + y2 + y3;

figure(1);
plot(t,y1,'r-o');
hold on;
plot(t,y2,'g-x');
plot(t,y3,'b-^');
plot(t,y4,'m-d');

grid on;
title('Sinusoid');
xlabel('Time, t [sec]');
ylabel('Signal, y(t)');
legend('1 Hz', '3 Hz', '5 Hz', 'Sum');
