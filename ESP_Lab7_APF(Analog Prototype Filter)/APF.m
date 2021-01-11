clc;
clear;

% 3.1 
[z_b,p_b,k_b] = buttap(5);
p_br = real(p_b);
p_bi = imag(p_b);

[z_c1, p_c1, k_c1] = cheb1ap(5,10);
p_c1_r = real(p_c1);
p_c1_i = imag(p_c1);

[z_c2, p_c2, k_c2] = cheb2ap(5,30);
p_c2_r = real(p_c2);
p_c2_i = imag(p_c2);
z_c2_r = real(z_c2);
z_c2_i = imag(z_c2);

[z_E, p_E, k_E] = ellipap(5,10,30);
p_E_r = real(p_E);
p_E_i = imag(p_E);
z_E_r = real(z_E);
z_E_i = imag(z_E);

center = [0,0]; % 중심
radius = 1; % 반지름 길이
dot_cir = linspace(0, 2*pi, 100); % 원을 이루는 점들의 벡터
x = radius*cos(dot_cir) + center(1);
y = radius*sin(dot_cir) + center(2);

figure(1)
subplot(221)
plot(p_br, p_bi, 'rx');
hold on;
plot(x,y, ':');
grid on;
xlabel('Real(s)');
ylabel('Imag(s),Butterworth');

subplot(222)
plot(p_c1_r, p_c1_i, 'rx');
hold on;
plot(x,y, ':');
grid on;
xlabel('Real(s)');
ylabel('Imag(s),Chebyshev Type-1');

subplot(223)
plot(p_c2_r, p_c2_i, 'rx');
hold on;
plot(z_c2_r, z_c2_i, 'bo');
hold on;
plot(x,y, ':');
grid on;
xlim([-1.5 1]);
xlabel('Real(s)');
ylabel('Imag(s),Chebyshev Type-2');

subplot(224)
plot(p_E_r, p_E_i, 'rx');
hold on;
plot(z_E_r, z_E_i, 'bo');
hold on;
plot(x,y, ':');
grid on;
ylim([-1.5 1.5]);
xlabel('Real(s)');
ylabel('Imag(s),Elliptic');


[b_b, a_b] = zp2tf(z_b,p_b,k_b);
w = linspace(0,2,1000);
H_b = freqs(b_b, a_b, w);
H_bw_db = 10*log10((abs(H_b)).^2); 

[b_c1, a_c1] = zp2tf(z_c1,p_c1,k_c1);
H_c_1 = freqs(b_c1, a_c1, w);
H_c1w_db = 10*log10((abs(H_c_1)).^2); 

[b_c2, a_c2] = zp2tf(z_c2,p_c2,k_c2);
H_c_2 = freqs(b_c2, a_c2, w);
H_c2w_db = 10*log10((abs(H_c_2)).^2);

[b_E, a_E] = zp2tf(z_E,p_E,k_E);
H_E = freqs(b_E, a_E, w);
H_Ew_db = 10*log10((abs(H_E)).^2);

figure(2)
subplot(221)
plot(w,H_bw_db);
grid on;
xlim([0 2]);
ylim([-40 5]);
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|^2[dB], Butterworth');

subplot(222)
plot(w,H_c1w_db);
grid on;
xlim([0 2]);
ylim([-70 5]);
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|^2[dB], Chebyshev Type-1');

subplot(223)
plot(w,H_c2w_db);
grid on;
xlim([0 2]);
ylim([-70 5]);
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|^2[dB], Chebyshev Type-2');

subplot(224)
plot(w,H_Ew_db);
grid on;
xlim([0 2]);
ylim([-70 5]);
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|^2[dB], Elliptic');

% 3.2
Ps_dB = -40;
w_Transition = 1;
ps = 10^(-40/10);
N = log((1/ps) - 1)/(2*log(1+w_Transition));
[z,p,k] = buttap(round(N));
p_r = real(p);
p_i = imag(p);

figure(3)
plot(p_r, p_i, 'rx');
hold on;
plot(x,y, ':');
grid on;
xlabel('Real(s)');
ylabel('Imag(s),Butterworth');

[a,b] = zp2tf(z,p,k);
w_1 = linspace(0,2.5,1000);
H = freqs(a, b, w_1);
H_wdB = 10*log10((abs(H)).^2);

figure(4)
plot(w_1,H_wdB);
grid on;
xlim([0 2.5]);
ylim([-50 5]);
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|^2[dB], Butterworth');

[num_lp, den_lp]=lp2lp(a, b, 300);
w_2 = linspace(0,5000,10000);
H_lp = freqs(num_lp, den_lp, w_2);
H_wdB_lp = 10*log10((abs(H_lp)).^2);

[num_bp1, den_bp1]=lp2bp(a, b, ((1000-300)/2)+300, 1000-300);
H_bp1 = freqs(num_bp1, den_bp1, w_2);
H_wdB_bp1 = 10*log10((abs(H_bp1)).^2);

[num_bp2, den_bp2]=lp2bp(a, b, ((2000-1000)/2)+1000, 2000-1000);
H_bp2 = freqs(num_bp2, den_bp2, w_2);
H_wdB_bp2 = 10*log10((abs(H_bp2)).^2);

[num_bp3, den_bp3]=lp2bp(a, b, ((4000-2000)/2)+2000, 4000-2000);
H_bp3 = freqs(num_bp3, den_bp3, w_2);
H_wdB_bp3 = 10*log10((abs(H_bp3)).^2);

[num_hp, den_hp]=lp2hp(a, b, 4000);
H_hp = freqs(num_hp, den_hp, w_2);
H_wdB_hp = 10*log10((abs(H_hp)).^2);

figure(5)
plot(w_2,H_wdB_lp);
hold on;
plot(w_2,H_wdB_bp1);
hold on;
plot(w_2,H_wdB_bp2);
hold on;
plot(w_2,H_wdB_bp3);
hold on;
plot(w_2,H_wdB_hp);
grid on;
xlim([0 5000]);
ylim([-30 10]);
xlabel('Frequency,[Hz]');
ylabel('|H(w)|^2[dB]');
legend('Filter1, LPF', 'Filter2, BPF', 'Filter3, BPF', 'Filter4, BPF', 'Filter5, HPF');
