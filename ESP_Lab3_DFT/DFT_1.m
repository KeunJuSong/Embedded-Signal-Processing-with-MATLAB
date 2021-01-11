clear;
clc;

N = 50;
n = [0:49];

%%% 구형파 주파수 해석

L_1 = 1;
L_2 = 10;
L_3 = 30;
L_4 = 50;

x_1 = zeros(1,N);
x_2 = zeros(1,N);
x_3 = zeros(1,N);
x_4 = zeros(1,N);

for i = 1 : N
    if(i <= L_1)
        x_1(i) = 1;
    else
        x_1(i) = 0;
    end
end

for i = 1 : N
    if(i <= L_1)
        x_1(i) = 1;
    else
        x_1(i) = 0;
    end
end

for i = 1 : N
    if(i <= L_2)
        x_2(i) = 1;
    else
        x_2(i) = 0;
    end
end

for i = 1 : N
    if(i <= L_3)
        x_3(i) = 1;
    else
        x_3(i) = 0;
    end
end

for i = 1 : N
    if(i <= L_4)
        x_4(i) = 1;
    else
        x_4(i) = 0;
    end
end

[f_hat_1, Xk_1, N_mult_1] = my_DFT(x_1,N);
[f_hat_2, Xk_2, N_mult_2] = my_DFT(x_2,N);
[f_hat_3, Xk_3, N_mult_3] = my_DFT(x_3,N);
[f_hat_4, Xk_4, N_mult_4] = my_DFT(x_4,N);


%%% 구형파 주파수 해석

figure(1)
subplot(4,2,1)
stem(n,x_1);
subplot(4,2,3)
stem(n,x_2);
subplot(4,2,5)
stem(n,x_3);
subplot(4,2,7)
stem(n,x_4);

subplot(4,2,2)
stem(f_hat_1, abs(Xk_1));
hold on;
DTFT_1 =  linspace(abs(Xk_1(1)),abs(Xk_1(N)),1024);
omega_1 = linspace(f_hat_1(1),f_hat_1(N),1024);
plot(omega_1, DTFT_1, 'r');
grid on;
ylim([0 2]);

subplot(4,2,4)
stem(f_hat_2, abs(Xk_2));
hold on;
[DTFT_2, omega_2] = resample(abs(Xk_2),f_hat_2,1024);
plot(omega_2, DTFT_2, 'r');
grid on;

subplot(4,2,6)
stem(f_hat_3, abs(Xk_3));
hold on;
[DTFT_3, omega_3] = resample(abs(Xk_3),f_hat_3,1024);
plot(omega_3, DTFT_3, 'r');
grid on;

subplot(4,2,8)
stem(f_hat_4, abs(Xk_4));
hold on;
[DTFT_4, omega_4] = resample(abs(Xk_4),f_hat_4,1024);
plot(omega_4, DTFT_4, 'r');
grid on;
ylim([0 60]);

