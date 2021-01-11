clear;
clc;
w_s = 0:0.01:5000*2*pi;
delta_w = 1;
P_s = -40;
p_s = 10^(P_s/10);
N = (log10(1/p_s - 1))/(2*log10(1+delta_w));

[z_b,p_b,k_b] = buttap(round(N));
[b_b, a_b] = zp2tf(z_b, p_b, k_b);

f_l = 300;
w_l = 2*pi*f_l;
[n_lpf,d_lpf] = lp2lp(b_b,a_b,w_l);
h_l = freqs(n_lpf,d_lpf,w_s);

f_b1 = 1000-300;
f_b1_c = 0.5*f_b1+300;
w_b1 = f_b1*2*pi;
w_b1_c = f_b1_c*2*pi;
[n_bpf1,d_bpf1] = lp2bp(b_b,a_b,w_b1_c,w_b1);
h_b1 = freqs(n_bpf1, d_bpf1, w_s);

f_b2 = 2000-1000;
f_b2_c = 0.5*f_b2+1000;
w_b2 = f_b2*2*pi;
w_b2_c = f_b2_c*2*pi;
[n_bpf2,d_bpf2] = lp2bp(b_b,a_b,w_b2_c,w_b2);
h_b2 = freqs(n_bpf2, d_bpf2, w_s);

f_b3 = 4000-2000;
f_b3_c = 0.5*f_b3+2000;
w_b3 = f_b3*2*pi;
w_b3_c = f_b3_c*2*pi;
[n_bpf3,d_bpf3] = lp2bp(b_b,a_b,w_b3_c,w_b3);
h_b3 = freqs(n_bpf3, d_bpf3, w_s);

f_h = 4000;
w_h = 2*pi*f_h;
[n_hpf,d_hpf] = lp2hp(b_b,a_b,w_h);
h_h = freqs(n_hpf,d_hpf,w_s);


plot(w_s/2/pi,10*log10((abs(h_l)).^2))
hold on
plot(w_s/2/pi,10*log10((abs(h_b1)).^2))
plot(w_s/2/pi,10*log10((abs(h_b2)).^2))
plot(w_s/2/pi,10*log10((abs(h_b3)).^2))
plot(w_s/2/pi,10*log10((abs(h_h)).^2))
axis([0 5000 -30 10])

legend(['LPF' 'BPF_1' 'BPF_2' 'BPF_3''HPF'])

grid on