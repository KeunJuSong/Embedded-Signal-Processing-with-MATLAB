clc;
clear;

% 3.1 - (2)
[z_b, p_b, k_b] = buttap(3);
p_br = real(p_b);
p_bi = imag(p_b);
[numb, denb] = zp2tf(z_b,p_b,k_b);

fs_1 = 5;
[numd_1, dend_1] = bilinear(numb, denb, fs_1);
fs_2 = 10;
[numd_2, dend_2] = bilinear(numb, denb, fs_2);

[zd_1, pd_1, kd_1] = tf2zp(numd_1,dend_1);

z_d1r = real(zd_1);
z_d1i = imag(zd_1);
p_d1r = real(pd_1);
p_d1i = imag(pd_1);

[zd_2, pd_2, kd_2] = tf2zp(numd_2,dend_2);

z_d2r = real(zd_2);
z_d2i = imag(zd_2);
p_d2r = real(pd_2);
p_d2i = imag(pd_2);

center = [0,0]; % 중심
radius = 1; % 반지름 길이
dot_cir = linspace(0, 2*pi, 100); % 원을 이루는 점들의 벡터
x = radius*cos(dot_cir) + center(1);
y = radius*sin(dot_cir) + center(2);

figure(1)
subplot(221)
plot(p_br, p_bi, 'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Real(s)');
ylabel('Imag(s)');
subplot(223)
plot(z_d1r, z_d1i, 'bo');
hold on;
plot(p_d1r,p_d1i, 'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
subplot(224)
plot(z_d2r,z_d2i, 'bo');
hold on;
plot(p_d2r,p_d2i, 'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');

% 3.1 - (3)
w = linspace(0,2,1000);
H_A = freqs(numb, denb, w);

% 이산주파수로 변경
Omega_1 = w./fs_1; 
Omega_2 = w./fs_2;

H_D_fs1 = freqz(numd_1, dend_1, Omega_1);
H_D_fs2 = freqz(numd_2, dend_2, Omega_2);

figure(2)
subplot(211)
plot(w, abs(H_A));
hold on;
plot(w, abs(H_D_fs1));
hold on;
plot(w, abs(H_D_fs2));
grid on;
axis([0 2 0 1.4]);
legend('Analog Butterworth Filter', 'Digital Butterworth Filter, fs=5Hz', 'Digital Butterworth Filter, fs=10Hz');
subplot(212)
plot(w, abs(H_A));
hold on;
plot(w, abs(H_D_fs1));
hold on;
plot(w, abs(H_D_fs2));
grid on;
axis([0.9 1.1 0.6 0.8]);
legend('Analog Butterworth Filter', 'Digital Butterworth Filter, fs=5Hz', 'Digital Butterworth Filter, fs=10Hz');

% 3.1 - (4)
fs_3 = 10;
[numd_3, dend_3] = bilinear(numb, denb, fs_3); % 디지털 필터로 변환한 전달함수, fs = 10[Hz]

figure(3)
subplot(311)
L = 50;
n = 0:L-1;
y_fs10 = filter(numd_3,dend_3,[1 zeros(1,L-1)]);
stem(n,y_fs10,'filled');
axis([0 50 0 0.05]);
xlabel('n');
ylabel('h[n], L=50');
grid on;

subplot(312)
L = 100;
n = 0:L-1;
y_fs10 = filter(numd_3,dend_3,[1 zeros(1,L-1)]);
stem(n,y_fs10,'filled');
axis([0 100 -0.02 0.06]);
xlabel('n');
ylabel('h[n], L=100');
grid on;

subplot(313)
L = 150;
n = 0:L-1;
y_fs10 = filter(numd_3,dend_3,[1 zeros(1,L-1)]);
stem(n,y_fs10,'filled');
axis([0 150 -0.02 0.06]);
xlabel('n');
ylabel('h[n], L=150');
grid on;

% 3.2 - (1)
% Analog Filter
[z_b7, p_b7, k_b7] = buttap(7);
w_1 = linspace(0, 5500, 110000);
[numb_7, denb_7] = zp2tf(z_b7,p_b7,k_b7);
[numb_7_bpf, denb_7_bpf] = lp2bp(numb_7, denb_7, ((2000+4000)/2)*2*pi, 2000*2*pi);
H_b7_bpf = freqs(numb_7_bpf, denb_7_bpf, w_1*2*pi);

[numb_7_hpf, denb_7_hpf] = lp2hp(numb_7, denb_7, 4000*2*pi);
H_b7_hpf = freqs(numb_7_hpf, denb_7_hpf, w_1*2*pi);

% Digital Filter - BPF,HPF 이산화
fs_4 = 50000; 

Omega_4 = (w_1./fs_4)*2*pi;
[numd_7_bpf, dend_7_bpf] = bilinear(numb_7_bpf, denb_7_bpf, fs_4);
H_d7_bpf = freqz(numd_7_bpf, dend_7_bpf, Omega_4);

[numd_7_hpf, dend_7_hpf] = bilinear(numb_7_hpf, denb_7_hpf, fs_4);
H_d7_hpf = freqz(numd_7_hpf, dend_7_hpf, Omega_4);

figure(4)
plot(w_1,abs(H_b7_bpf));
hold on;
plot(w_1,abs(H_d7_bpf));
hold on;
plot(w_1,abs(H_b7_hpf));
hold on;
plot(w_1,abs(H_d7_hpf));
grid on;
axis([1500 5500 0 1.4]);
legend('Analog BPF', 'Digital BPF', 'Analog HPF', 'Digital HPF');











