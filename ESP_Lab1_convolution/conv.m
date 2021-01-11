clear;
clc;

%%% 컨벌루션 연산

%%% 2번 
% n1 = [-5:5];
% x1 = [0,0,0,0,0,1,1,1,0,0,0];
% n2 = [-5:5];
% x2 = [0,0,0,1,1,1,1,1,0,0,0];
% 
% [n_1, y_1] = convolution(x1,n1,x2,n2);
% 
% figure(1)
% subplot(311)
% stem(n1,x1,'filled');
% xlabel('n');
% ylabel('x1[n]');
% 
% subplot(312)
% stem(n2,x2,'filled');
% xlabel('n');
% ylabel('x2[n]');
% 
% subplot(313)
% stem(n_1, y_1,'filled');
% xlabel('n');
% ylabel('y[n]');

%%% 3번
% n1 = [0:15];
% x1 = cos(2*pi*0.1*n1); 
% n2 = [-5:5];
% x2 = [0,0,0,0,0,1,0,0,0,0,0];
% 
% [n_1, y_1] = convolution(x1,n1,x2,n2);
% 
% figure(1)
% subplot(311)
% stem(n1,x1,'filled');
% xlabel('n');
% ylabel('x1[n]');
% 
% subplot(312)
% stem(n2,x2,'filled');
% xlabel('n');
% ylabel('x2[n]');
% 
% subplot(313)
% stem(n_1, y_1,'filled');
% xlabel('n');
% ylabel('y[n]');

%%% 4번
% n1 = [0:15];
% x1 = cos(2*pi*0.1*n1); 
% n2 = [-5:5];
% x2 = cos(2*pi*0.05*n2);
% 
% [n_1, y_1] = convolution(x1,n1,x2,n2);
% 
% figure(1)
% subplot(311)
% stem(n1,x1,'filled');
% xlabel('n');
% ylabel('x1[n]');
% 
% subplot(312)
% stem(n2,x2,'filled');
% xlabel('n');
% ylabel('x2[n]');
% 
% subplot(313)
% stem(n_1, y_1,'filled');
% xlabel('n');
% ylabel('y[n]');
% ylim([-4 4]);


%%% 컨벌루션 연산 특성

%%% 1번

% n1 = [-5:5];
% x1 = cos(2*pi*0.05*n1);
% 
% n2 = [0:5];
% x2 = [1,2,3,4,5,6];
% 
% [n_1, y_1] = convolution(x1,n1,x2,n2);
% [n_2, y_2] = convolution(x2,n2,x1,n1);
% 
% figure(1)
% subplot(311)
% stem(n1,x1,'filled');
% xlabel('n');
% ylabel('x1[n]');
% 
% subplot(312)
% stem(n2,x2,'filled');
% xlabel('n');
% ylabel('x2[n]');
% 
% subplot(313)
% stem(n_1,y_1,'filled');
% hold on;
% stem(n_2,y_2,'filled','--s');
% legend('x1[n]*x2[n]','x2[n]*x1[n]');
% xlabel('n');
% ylabel('y[n]');

%%% 2번

n1 = [0:15];
x1 = cos(2*pi*0.1*n1);

n2 = [-5:5];
x2 = cos(2*pi*0.05*n2);

n3 = [0:10];
x3 = (-1).^n3;

[n_1, y_1] = convolution(x1,n1,x2,n2);
[n_2, y_2] = convolution(y_1,n_1,x3,n3);

[n_3, y_3] = convolution(x2,n2,x3,n3);
[n_4, y_4] = convolution(x1,n1,y_3,n_3);

figure(1)
subplot(411)
stem(n1,x1,'filled');
xlabel('n');
ylabel('x1[n]');

subplot(412)
stem(n2,x2,'filled');
xlabel('n');
ylabel('x2[n]');

subplot(413)
stem(n3,x3,'filled');
xlabel('n');
ylabel('x3[n]');

subplot(414)
stem(n_2,y_2,'filled');
hold on;
stem(n_4,y_4,'filled','--s');
legend('(x1[n]*x2[n])*x3[n]','x1[n]*(x2[n]*x3[n])');
xlabel('n');
ylabel('y[n]');
ylim([-4 4]);

%%% 3번

% n0 = 5;
% 
% n_1 = [0:15];
% x_1 = cos(2*pi*0.1*n_1);
% 
% x_3 = cos(2*pi*0.1*(n_1-n0));
% 
% for i = 1:max(n_1) + 1
%     if i > max(n_1) + 1 - n0
%         x_3(i) = 0;
%     end
% end
% 
% n_2 = [0:5];
% x_2 = (0.5).^n_2;
% 
% [n1, y1] = convolution(x_1,n_1,x_2,n_2);
% [n2, y2] = convolution(x_3,n_1,x_2,n_2);
% 
% figure(1);
% subplot(311)
% stem(n_1,x_1,'filled');
% xlabel('n');
% ylabel('x[n]');
% subplot(312)
% stem(n_2,x_2,'filled');
% xlabel('n');
% ylabel('h[n]');
% subplot(313)
% stem(n1,y1,'filled');
% xlabel('n');
% ylabel('y[n]');
% 
% figure(2);
% subplot(311)
% stem(n_1,x_3,'filled', 'r');
% xlabel('n');
% ylabel('x[n-5]');
% subplot(312)
% stem(n_2,x_2,'filled');
% xlabel('n');
% ylabel('h[n]');
% subplot(313)
% stem(n2,y2,'filled', 'r');
% xlabel('n');
% ylabel('y[n-5]');
