clc;
clear;

% code1
% t1 = [0:0.01:1];
% t2 = [1:0.01:6];
% t = [t1 t2];
% 
% y1 = t1;
% y2 = 1./t2;
% y = [y1 y2];
% 
% figure(1);
% plot(t,y);
% axis([0 6 0 2]);
% grid on;

% code2
t = linspace(0,1,100);
y = t;

figure(1);
plot(t,y,'b');
hold on;

t = linspace(1,6,100);
y = 1./t;
plot(t,y,'b');
axis([0 6 0 2]);

xlabel('t');
ylabel('y');
grid on;