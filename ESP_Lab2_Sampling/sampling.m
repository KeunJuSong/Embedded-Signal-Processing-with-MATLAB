clear;
clc;

t1 = -5;
t2 = 5;
fs = 15;           % fs = 10, 15, 20
N = 4096;

%실습 3.1 - 1번
[t, p] = impulse_train2(t1,t2,fs,N);

% 실습 3.1 - 3번

[f3_1, X_1] = myfun_SA( t,p );

% 실습 3.2 - sinc함수
tau = 20*pi;

x = tau*sinc( (tau / (2*pi) ).*t);

[f3_2, X_2] = myfun_SA( t,x );


%실습 3.3 - 표본화(sampling)
% t
y = x.*p;

[f3_3, X_3] = myfun_SA( t,y );

% 3.5 LPF 이용한 복원 (N차 버터워스 필터)
% fc = 8;
% [z, p, k] = buttap(5) ;
% [num, den] = zp2tf(z,p,k) ;
% [num, den] = lp2lp(num, den, 2*pi*fc) ;
% [num_d, den_d] = bilinear( num, den, 1/abs( t(2)-t(1) ) ) ;

%y_out = filter( num_d, den_d, y_in ) ;



%%% 실습 3.4 - demo 시간영역과 주파수 영역에서 표본화 비교

% figure(1)
% 
% subplot(3,2,1)
% stem(t,p);
% xlim([-1 1]);
% grid on;
% 
% subplot(3,2,2)
% plot( f3_1, abs(X_1) );
% xlim([-30 30]);
% ylim([0 0.5]);
% grid on;
% 
% subplot(3,2,3)
% plot( t, x );
% xlim([-1 1]);
% ylim([-20 80]);
% grid on;
% 
% subplot(3,2,4)
% plot( f3_2, abs(X_2) );
% xlim([-30 30]);
% ylim([0 8]);
% grid on;
% 
% subplot(3,2,5)
% plot( t,y );
% xlim([-1 1]);
% ylim([-20 80]);
% grid on;
% 
% subplot(3,2,6)
% plot( f3_3, abs(X_3) ); 
% xlim([-30 30]);
% ylim([0 0.4]);
% grid on;

%%% 3.4 - demo fs = 10hz

% figure(1)
% 
% subplot(3,2,1)
% stem(t,p);
% xlim([-1 1]);
% grid on;
% 
% subplot(3,2,2)
% plot( f3_1, abs(X_1) );
% xlim([-30 30]);
% ylim([0 0.25]);
% grid on;
% 
% subplot(3,2,3)
% plot( t, x );
% xlim([-1 1]);
% ylim([-20 80]);
% grid on;
% 
% subplot(3,2,4)
% plot( f3_2, abs(X_2) );
% xlim([-30 30]);
% ylim([0 8]);
% grid on;
% 
% subplot(3,2,5)
% plot( t,y );
% xlim([-1 1]);
% ylim([-20 80]);
% grid on;
% 
% subplot(3,2,6)
% plot( f3_3, abs(X_3) ); 
% xlim([-30 30]);
% grid on;


%%% 3.4 - demo fs = 15hz

figure(1)

subplot(3,2,1)
stem(t,p);
xlim([-1 1]);
grid on;

subplot(3,2,2)
plot( f3_1, abs(X_1) );
xlim([-30 30]);
ylim([0 0.25]);
grid on;

subplot(3,2,3)
plot( t, x );
xlim([-1 1]);
ylim([-20 80]);
grid on;

subplot(3,2,4)
plot( f3_2, abs(X_2) );
xlim([-30 30]);
ylim([0 8]);
grid on;

subplot(3,2,5)
plot( t,y );
xlim([-1 1]);
ylim([-20 80]);
grid on;

subplot(3,2,6)
plot( f3_3, abs(X_3) ); 
xlim([-30 30]);
grid on;


%%% 3.5 LPF에 의한 복원(N차 바터워스 필터) - fs = 10 hz, 15 hz, 20hz

% figure(1)
% 
% subplot(2,2,1)
% plot( t,y );
% xlim([-1 1]);
% ylim([-20 80]);
% grid on;
% 
% subplot(2,2,2)
% y_out_1 = filter( num_d, den_d, y);
% plot(t, y_out_1);
% xlim([-1 1]);
% grid on;
% 
% subplot(2,2,3)
% plot( f3_3, abs(X_3) ); 
% xlim([-30 30]);
% grid on;
% 
% subplot(2,2,4)
% [f_3_5, X_3_5] = myfun_SA( t, y_out_1 );
% plot(f_3_5, abs(X_3_5));
% xlim([-30 30]);
% grid on;



