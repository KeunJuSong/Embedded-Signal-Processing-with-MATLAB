clear;
clc;

t = linspace( 0, 2, 200 );

f = 1;
A = 3;

Amp_in = A*cos( 2*pi*f*t );

alpha = 1.5;
K = 2;

Amp_out = amp_k_alpha( alpha, K, Amp_in );

figure(1)
plot( t, Amp_in, t, Amp_out, 'r-x');
grid on ;
legend('Amp input', 'Amp output');