clc;
clear;

% 3.3 신호의 필터링
[z_b7, p_b7, k_b7] = buttap(7);
[numb_7, denb_7] = zp2tf(z_b7,p_b7,k_b7);

w_2 = linspace(0,600,150000);
[numb_7_lpf, denb_7_lpf] = lp2lp(numb_7, denb_7, 300);

fs_5 = 3000;

Omega_5 = (w_2./fs_5);
[numd_7_lpf, dend_7_lpf] = bilinear(numb_7_lpf, denb_7_lpf, fs_5); % bilinear fs=3000으로 해야 정확!!
H_d_7 = freqz(numd_7_lpf,dend_7_lpf,Omega_5); %이산화된 주파수 응답 

% 입력 신호
N_1 = 500;
n_1 = linspace(0,N_1,3000);
f1 = 100;
f2 = 500;
x_1 = cos((2*pi)*(f1/fs_5).*n_1) + cos((2*pi)*(f2/fs_5).*n_1);

Y_D0 = filter(numd_7_lpf, dend_7_lpf, x_1);

t = n_1/(fs_5);
[f_x, X_1] = myfun_SA( t, x_1 );
[f_y, Y_f] = myfun_SA( t, Y_D0 );

figure(5)
subplot(321)
plot(t,x_1);
grid on;
xlabel('t[sec]');
ylabel('x(t)');
xlim([0 0.1])

subplot(322)
plot(f_x , abs(X_1),'-o');
grid on;
xlabel('f[Hz]');
ylabel('|X(f)|');
axis([0 600 0 0.08]);

subplot(324)
plot(w_2,abs(H_d_7));
grid on;

subplot(325)
plot(t,Y_D0);
grid on;
xlabel('t[sec]');
ylabel('y(t)');
xlim([0 0.1])
grid on;

subplot(326)
plot(f_y , abs(Y_f),'-o');
grid on;
xlabel('f[Hz]');
ylabel('|Y(f)|');
axis([0 600 0 0.08]);


