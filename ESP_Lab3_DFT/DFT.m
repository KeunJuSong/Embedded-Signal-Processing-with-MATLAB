clear;
clc;

N = 50;
n = [0:49];


%%% 구형파 주파수 해석

% L = 10;
% x = zeros(1,N);
% for i = 1 : N
%     if(i <= L)
%         x(i) = 1;
%     else
%         x(i) = 0;
%     end
% end

x1 = cos(2*pi*0.1*n);

% if(N > length(x))
%     for i = 1:N - length(x)
%         x = [ x 0 ];
%     end
% end

x2 = 0.5*cos(2*pi*0.2*n);
x3 = 0.1*cos(2*pi*0.3*n);
x = x1 + x2 + x3;
 
[f_hat_1, Xk_1, N_mult_1] = my_DFT(x1,N);

[f_hat_2, Xk_2, N_mult] = my_DFT(x,N);

figure(1)
subplot(2,1,1)
stem(n,x1, 'filled' );
grid on;
subplot(2,1,2)
stem(f_hat_1, abs(Xk_1), 'filled' );
ylim([0 25]);

figure(2)
subplot(2,1,1)
stem(n,x, 'filled' );
grid on;
subplot(2,1,2)
stem(f_hat_2, abs(Xk_2), 'filled' );
ylim([0 25]);

N_mult


%%% 구형파 주파수 해석

%hold on;

% L = 1 일 때

% DTFT =  linspace(abs(Xk(1)),abs(Xk(N)),100);
% omega = linspace(f_hat(1),f_hat(N),100);
% plot(omega, DTFT, 'r');
% grid on;
% ylim([0 2]);

% L = 10, 30, 50 일 때

% [DTFT, omega] = resample(abs(Xk),f_hat,1024);
% plot(omega, DTFT, 'r');
% legend('DFT','DTFT');

% L = 50일 때

% ylim([0 60]);

grid on;