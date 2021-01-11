clc;
clear;

N = 128; 
n_1 = [0:N-1];

% 실습 1
%x_input = cos(2*pi*0.1*(n_1));

% 실습 2,3
x_input = (0.3*cos(2*pi*0.1*(n_1))) + (0.8*sin(2*pi*0.3*(n_1)));

% FFT - 입력신호 재배열
FFT_n = zeros(1, N);

for k = 0 : N-1

    FFT_n(k+1) = bin2dec( fliplr(dec2bin(k,log2(N))) );
    
end

% 실습 1
x = cos(2*pi*0.1*(FFT_n));

% 실습 2
x = (0.3*cos(2*pi*0.1*(FFT_n))) + (0.8*sin(2*pi*0.3*(FFT_n)));

% 실습 1,2
[f_hat_F,Xk_F,N_mult_F] = my_FFT1(x,N);

% 실습 2_DFT
[f_hat_D,Xk_D,N_mult_D] = my_DFT(x_input,N);

% 실습 1

% figure(1)
% subplot(211)
% stem(n_1,x_input);
% xlim([0 N-1])
% subplot(212)
% stem(f_hat_F,abs(Xk_F));


% 실습 2

figure(1)
subplot(211)
stem(n_1,x_input);
xlim([0 N-1])
grid on;
subplot(212)
stem(f_hat_F,abs(Xk_F));
hold on;
stem(f_hat_D,abs(Xk_D), '-xr');
legend('FFT', 'DFT');
grid on;


% 실습 3 - FFT DFT 연산복잡도 비교

FFT_N_mult = [ (16/2)*log2(16), (32/2)*log2(32), (64/2)*log2(64), (128/2)*log2(128) ];
DFT_N_mult = [ (16)^2, (32)^2, (64)^2, (128)^2  ];
N_points = [16, 32, 64, 128];

Raito_of_DFT_FFT = zeros(1,length(N_points));
for k = 1:length(N_points)
    Raito_of_DFT_FFT(k) = FFT_N_mult(k) / DFT_N_mult(k);
end

figure(2)
semilogy(N_points, FFT_N_mult,'-^g');
hold on;
semilogy(N_points, DFT_N_mult,'-ob');
legend( 'FFT', 'DFT' );
grid on;
ylim([ 10^1 10^5 ]);

figure(3)
semilogy(N_points, Raito_of_DFT_FFT, '-ok');
grid on;
ylim([0.02 0.14]);