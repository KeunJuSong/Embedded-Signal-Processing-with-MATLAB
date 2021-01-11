clc;
clear;

% 3.1
[x, fs] = audioread('Audio_Pop01_15sec.wav');

t = linspace(0,15,length(x));
x_input = transpose(x);
[f0, X_input] = myfun_SA( t, x_input );

%sound(x,fs);

figure(1)
subplot(211)
plot(t,x_input)
grid on;
subplot(212)
plot(f0,abs(X_input));
xlim([0 5000]);
grid on;

% 3.2
fn = fs/2;
wn = linspace(0,5000,15000);
Omega = ((2*pi*wn)./(fs));
[numd7_lpf, den7_lpf] = butter(7, 500/fn, 'low');
[z7_lpf,p7_lpf,k7_lpf] = tf2zp(numd7_lpf,den7_lpf);
Hd7_lpf = freqz(numd7_lpf, den7_lpf, Omega);

z7_r = real(z7_lpf);
z7_i = imag(z7_lpf);
p7_r = real(p7_lpf);
p7_i = imag(p7_lpf);

[numd12_bpf, den12_bpf] = butter(6, [((500)/fn),((1500)/fn)], 'bandpass');
[z12_bpf,p12_bpf,k12_bpf] = tf2zp(numd12_bpf,den12_bpf);
Hd12_bpf = freqz(numd12_bpf, den12_bpf, Omega);

z12_r = real(z12_bpf);
z12_i = imag(z12_bpf);
p12_r = real(p12_bpf);
p12_i = imag(p12_bpf);

[numd12_bpf_1, den12_bpf_1] = butter(6, [((1500)/fn),((2500)/fn)], 'bandpass');
[z12_bpf_1,p12_bpf_1,k12_bpf_1] = tf2zp(numd12_bpf_1,den12_bpf_1);
Hd12_bpf_1 = freqz(numd12_bpf_1, den12_bpf_1, Omega);

z12_r_1 = real(z12_bpf_1);
z12_i_1 = imag(z12_bpf_1);
p12_r_1 = real(p12_bpf_1);
p12_i_1 = imag(p12_bpf_1);

[numd12_bpf_2, den12_bpf_2] = butter(6, [((2500)/fn),((3500)/fn)], 'bandpass');
[z12_bpf_2,p12_bpf_2,k12_bpf_2] = tf2zp(numd12_bpf_2,den12_bpf_2);
Hd12_bpf_2 = freqz(numd12_bpf_2, den12_bpf_2, Omega);

z12_r_2 = real(z12_bpf_2);
z12_i_2 = imag(z12_bpf_2);
p12_r_2 = real(p12_bpf_2);
p12_i_2 = imag(p12_bpf_2);

[numd10_hpf, den10_hpf] = butter(10, ((3500)/fn), 'high');
[z10_hpf,p10_hpf,k10_hpf] = tf2zp(numd10_hpf,den10_hpf);
Hd10_hpf = freqz(numd10_hpf, den10_hpf, Omega);

z10_r = real(z10_hpf);
z10_i = imag(z10_hpf);
p10_r = real(p10_hpf);
p10_i = imag(p10_hpf);

center = [0,0]; % 중심
radius = 1; % 반지름 길이
dot_cir = linspace(0, 2*pi, 100); % 원을 이루는 점들의 벡터
x = radius*cos(dot_cir) + center(1);
y = radius*sin(dot_cir) + center(2);

% 주파수 응답 크기
figure(2)
plot(wn,abs(Hd7_lpf));
hold on;
plot(wn,abs(Hd12_bpf));
hold on;
plot(wn,abs(Hd12_bpf_1));
hold on;
plot(wn,abs(Hd12_bpf_2));
hold on;
plot(wn,abs(Hd10_hpf));
grid on;
legend('Channel 1 filter','Channel 2 filter','Channel 3 filter','Channel 4 filter','Channel 5 filter');

% pole-zero plot
figure(3)
subplot(321)
plot(z7_r,z7_i,'bo');
hold on;
plot(p7_r,p7_i,'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Ch1 filter');
axis([-1.5 1.5 -1.5 1.5])

subplot(322)
plot(z12_r,z12_i,'bo');
hold on;
plot(p12_r,p12_i,'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Ch2 filter');
axis([-1.5 1.5 -1.5 1.5])

subplot(323)
plot(z12_r_1,z12_i_1,'bo');
hold on;
plot(p12_r_1,p12_i_1,'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Ch3 filter');
axis([-1.5 1.5 -1.5 1.5])

subplot(324)
plot(z12_r_2,z12_i_2,'bo');
hold on;
plot(p12_r_2,p12_i_2,'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Ch4 filter');
axis([-1.5 1.5 -1.5 1.5])

subplot(325)
plot(z10_r,z10_i,'bo');
hold on;
plot(p10_r,p10_i,'rx');
hold on;
plot(x,y,':');
grid on;
xlabel('Ch5 filter');
axis([-1.5 1.5 -1.5 1.5])

% 3.3
y1_n = filter(numd7_lpf,den7_lpf,x_input);
%sound(y1_n,fs);
[f1, Y1_N] = myfun_SA( t, y1_n );

y2_n = filter(numd12_bpf,den12_bpf,x_input);
%sound(y2_n,fs);
[f2, Y2_N] = myfun_SA( t, y2_n );

y3_n = filter(numd12_bpf_1,den12_bpf_1,x_input);
%sound(y3_n,fs);
[f3, Y3_N] = myfun_SA( t, y3_n );

y4_n = filter(numd12_bpf_2,den12_bpf_2,x_input);
%sound(y4_n,fs);
[f4, Y4_N] = myfun_SA( t, y4_n );

y5_n = filter(numd10_hpf,den10_hpf,x_input);
%sound(y5_n,fs);
[f5, Y5_N] = myfun_SA( t, y5_n );

figure(4)
subplot(521)
plot(t,y1_n);
grid on;
subplot(522)
plot(f1,abs(Y1_N));
xlim([0 5000]);
grid on;

subplot(523)
plot(t,y2_n);
grid on;
subplot(524)
plot(f2,abs(Y2_N));
xlim([0 5000]);
grid on;

subplot(525)
plot(t,y3_n);
grid on;
subplot(526)
plot(f3,abs(Y3_N));
xlim([0 5000]);
grid on;

subplot(527)
plot(t,y4_n);
grid on;
subplot(528)
plot(f4,abs(Y4_N));
xlim([0 5000]);
grid on;

subplot(529)
plot(t,y5_n);
grid on;
subplot(5,2,10)
plot(f5,abs(Y5_N));
xlim([0 5000]);
grid on;

c1 = 1/13;
c2 = 5/13;
c3 = 4/13;
c4 = 2/13;
c5 = 1/13;
w = 1;

y_0 = (c1*y1_n) + (c2*y2_n) +(c3*y3_n) +(c4*y4_n) +(c5*y5_n);
x2 = 0;
for i = 1:length(x_input)
    x2 = x2 + (x_input(i)).^2;   
end

y2 = 0;
for j = 1:length(y_0)
    y2 = y2 + (y_0(j)).^2;   
end

c0 = sqrt(x2/y2);
y_mix = c0.*y_0;
y_n = w*y_mix;
sound(y_n,fs)
[f_Y, Y_N] = myfun_SA( t, y_n );

figure(5)
subplot(211)
plot(t,x_input,'r')
hold on;
plot(t,y_n,'k')
grid on;
legend('Input','Output');
subplot(212)
plot(f0,abs(X_input),'r');
hold on;
plot(f_Y,abs(Y_N),'k');
xlim([0 5000]);
grid on;
legend('Input','Output');


