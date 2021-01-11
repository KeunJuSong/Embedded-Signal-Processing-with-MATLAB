clc;
clear;


% 실습 3.1의 첫번째----------------------------------------------------------
zero_vec_s = roots([1 5]); % 분자식의 근(zero점) 맨뒤의 s는 s영역이란뜻(라플라스 역변환)
pole_vec_s = roots([1 2 5]); % 분모식의 근(pole점)

figure(1) % pole-zero plot (s영역)
plot(real(pole_vec_s), imag(pole_vec_s), 'rx');
hold on;
plot(real(zero_vec_s), imag(zero_vec_s), 'bo');
grid on;
ylim([-2.5 2.5]);
xlim([-5.3 0]);
xlabel('Real(s)');
ylabel('Imag(s)');
title('실습3.1 첫번째');


% 실습 3.1의 두번째----------------------------------------------------------
[r_s,p_s,k] = residue([1 5],[1 2 5]); % p_s는 pole점 r_s는 그냥상수(zero점이 아님)
t = 0: 0.01: 10; % 연속시간 0~10
h_t = zeros(1,length(t)); % 연속시간만큼 충격응답 벡터를 생성

for i = 1:1:length(t) % 연속시간만큼 반복
    for k = 1:1:length(p_s) % pole점의 개수만큼 반복(라플라스 역변환 꼴을 생각)
         h_t(i) = (r_s(k) * exp(p_s(k)*t(i))) + h_t(i); % 라플라스역변환 연산(k는 현재 역변환 항의 번호)
    end
end

figure(2) %충격응답
plot(t,h_t);
grid on;
ylim([-0.4 1.6]);
xlabel('t[sec]');
ylabel('h(t)');
title('실습3.1 두번째');


%실습 3.1의 세번째-----------------------------------------------------------
w = -4: 0.001 : 4; % 주파수 벡터 생성
H_w = zeros(1,length(w)); % 주파수 벡터수만큼 주파수응답 벡터 생성

for i = 1:1:length(w) %각각의 w(주파수)마다
    wj = w(i)*1j;
    Q = 1; % 분자 버퍼
    P = 1; % 분모 버퍼
    
    for k = 1:1:length(zero_vec_s) % 현재 w(주파수)일때 분자 계산(zero점 개수만큼 곱)
        Q = (wj - zero_vec_s(k)) * Q;
    end
    
    for m = 1:1:length(pole_vec_s) % 현재 w(주파수)일때 분모 계산(pole점 개수만큼 곱)
        P = (wj - pole_vec_s(m)) * P;
    end
    
    H_w(i) = Q/P; % 현재 w(주파수)의 주파수응답
end

figure(3) % 주파수 응답
plot(w,abs(H_w));
grid on;
xlabel('Frequency w [rad/sec]');
ylabel('|H(w)|');
title('실습3.1 세번째');


%실습 3.2 첫 번째 1번 시스템-------------------------------------------------
sys1_zero = -5; % 시스템1의 zero점
sys1_pole = [-2j-1,2j-1]; % 시스템1의 pole점

[Q1,P1] = zp2tf(sys1_zero(:),sys1_pole(:),1); % 시스템1의 전달함수
[r1_s,p1_s,k] = residue(Q1(:),P1(:)); % 전달함수의 부분분수 전개
h1_t = zeros(1,length(t)); % 연속시간만큼 시스템1의 충격응답 벡터를 생성

for i = 1:1:length(t) % 연속시간만큼
    for k = 1:1:length(p1_s) % 시스템1의 pole점의 개수 만큼
         h1_t(i) = (r1_s(k) * exp(p1_s(k)*t(i))) + h1_t(i); % 라플라스역변환 연산(k는 현재 역변환 항의 번호)
    end
end

figure(4) % 시스템1의 충격응답
subplot(311)
plot(t,h1_t);
grid on;
ylim([-0.5 1.5]);
ylabel('h1(t) system #1');
title('실습3.2');


%실습 3.2 첫 번째 2번 시스템-------------------------------------------------
sys2_zero = -5; % 시스템2의 zero점
sys2_pole = [-2j,2j]; % 시스템2의 pole점

[Q2,P2] = zp2tf(sys2_zero(:),sys2_pole(:),1); % 시스템2의 전달함수
[r2_s,p2_s,k] = residue(Q2(:),P2(:)); % 전달함수의 부분분수 전개
h2_t = zeros(1,length(t)); % 연속시간만큼 시스템2의 충격응답 벡터를 생성

for i = 1:1:length(t) % 연속시간만큼
    for k = 1:1:length(p2_s) % 시스템2의 pole점의 개수 만큼
         h2_t(i) = (r2_s(k) * exp(p2_s(k)*t(i))) + h2_t(i); % 라플라스역변환 연산(k는 현재 역변환 항의 번호)
    end
end

subplot(312) % 시스템2의 충격응답
plot(t,h2_t);
ylim([-4 4]);
ylabel('h2(t) system #2');


%실습 3.2 첫 번째 3번 시스템-------------------------------------------------
sys3_zero = -5; % 시스템3의 zero점
sys3_pole = [-2j+1,2j+1]; % 시스템3의 pole점

[Q3,P3] = zp2tf(sys3_zero(:),sys3_pole(:),1); % 시스템3의 전달함수
[r3_s,p3_s,k] = residue(Q3(:),P3(:)); % 전달함수의 부분분수 전개
h3_t = zeros(1,length(t)); % 연속시간만큼 시스템3의 충격응답 벡터를 생성

for i = 1:1:length(t) % 연속시간만큼
    for k = 1:1:length(p3_s) % 시스템3의 pole점의 개수 만큼
         h3_t(i) = (r3_s(k) * exp(p3_s(k)*t(i))) + h3_t(i); % 라플라스역변환 연산(k는 현재 역변환 항의 번호)
    end
end

subplot(313) % 시스템3의 충격응답
plot(t,h3_t);
%ylim([-5 10*10^4]);
%axis([0 10 -5 10^5]);
axis auto;
ylabel('h3(t) system #3');
xlabel('t[sec]');


%실습 3.3 첫 번째------------------------------------------------------------
zero_vec_z = roots([1 -0.3]); %분자식의 근(zero점) 맨뒤의 z는 z영역이란뜻(z 역변환)
pole_vec_z = roots([1 0.3 0.36 0.108]); %분모식의 근(pole점)

% 원그리기
center = [0,0]; % 중심
radius = 1; % 반지름 길이
dot_cir = linspace(0, 2*pi, 100); % 원을 이루는 점들의 벡터
x = radius*cos(dot_cir) + center(1);
y = radius*sin(dot_cir) + center(2);
%위의 두식으로 원을 그림

figure(5) % pole-zero plot (z영역)
plot(x,y, ':')
hold on;
plot(real(pole_vec_z), imag(pole_vec_z), 'rx');
hold on;
plot(real(zero_vec_z), imag(zero_vec_z), 'bo');
grid on;
ylim([-1 1]);
xlim([-1 1]);
xlabel('Real(z)');
ylabel('Imag(z)');
title('실습3.3 첫번째');


% 실습 3.3의 두번째----------------------------------------------------------
[r_z,p_z,k] = residue([1 -0.3],[1 0.3 0.36 0.108 0]); % p_z는 pole점 r_z는 그냥상수(zero점이 아님)
% 전달함수 분모의 차수를 1 늘려줘야함 그래서 맨 마지막에 0을 넣어줌(중요 z역변환하기 위해서임)
n = 0: 1: 20; % 이산시간 0~20이산시간만큼 충격응답 벡터를 생성
h_n = zeros(1,length(n)); % 

for i = 1:1:length(n) % 이산시간만큼 반복
    for k = 1:1:length(p_z) % pole점의 개수 만큼 반복(z변환의 역변환을 생각)
         h_n(i) = (r_z(k) * (p_z(k)^n(i))) + h_n(i); % z역변환 연산(k는 현재 역변환 항의 번호)
    end
end

figure(6) % 충격응답
stem(n,h_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-0.6 1]);
xlabel('n');
ylabel('h[n]');
title('실습3.3 두번째');


%실습 3.3의 세번째-----------------------------------------------------------
PI = -pi: 0.01 : pi; % 주파수 벡터 생성
H_PI = zeros(1,length(PI)); %주파수의 벡터수만큼 주파수응답 벡터 생성

for i = 1:1:length(PI) %각각의 PI(주파수)마다
    PIj = exp(PI(i)*1j);
    Q_z = 1; % 분자 버퍼
    P_z = 1; % 분모 버퍼
    
    for k = 1:1:length(zero_vec_z) % 현재 PI(주파수)일때 분자 계산(zero점 개수만큼 곱)
        Q_z = (PIj - zero_vec_z(k)) * Q_z;
    end
    
    for m = 1:1:length(pole_vec_z) % 현재 PI(주파수)일때 분모 계산(pole점 개수만큼 곱)
        P_z = (PIj - pole_vec_z(m)) * P_z;
    end
    
    H_PI(i) = Q_z/P_z; % 현재 PI(주파수)의 주파수응답
end

figure(7) % 주파수 응답
plot(PI,abs(H_PI));
grid on;
xlim([-pi pi]);
xlabel('Frequency PI [rad]');
ylabel('|H(PI)|');
title('실습3.3 세번째');


%실습 3.4 1번 시스템---------------------------------------------------------
sys1_zero_z = -5; % 시스템1의 zero점
sys1_pole_z = [0.5*exp((pi/4)*1j),0.5*exp(-(pi/4)*1j)]; % 시스템1의 pole점

[Q1_z,P1_z] = zp2tf(sys1_zero_z(:),sys1_pole_z(:),1); % 시스템1의 전달함수
P1_z =[P1_z 0]; % z역변환을 위해 분모의 지수를 1 늘려야함
[r1_z,p1_z,k] = residue(Q1_z(:),P1_z(:)); % 전달함수의 부분분수 전개
h2_n = zeros(1,length(n)); % 이산시간만큼 시스템1의 충격응답 벡터 생성

for i = 1:1:length(n) % 이산시간만큼
    for k = 1:1:length(p1_z) % 시스템1의 pole점의 개수 만큼
         h2_n(i) = (r1_z(k) * (p1_z(k)^n(i))) + h2_n(i); % z역변환 연산(k는 현재 역변환 항의 번호)
    end
end

figure(8) % 시스템1의 충격응답
subplot(311)
stem(n,h2_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-2 6]);
ylabel('h1[n] system #1');
title('실습3.4');


%실습 3.4 2번 시스템---------------------------------------------------------
sys2_zero_z = -5; % 시스템2의 zero점
sys2_pole_z = [exp((pi/4)*1j),exp(-(pi/4)*1j)]; % 시스템2의 pole점

[Q2_z,P2_z] = zp2tf(sys2_zero_z(:),sys2_pole_z(:),1); % 시스템2의 전달함수
P2_z =[P2_z 0]; % z역변환을 위해 분모의 지수를 1 늘려야함
[r2_z,p2_z,k] = residue(Q2_z(:),P2_z(:)); % 전달함수의 부분분수 전개
h2_n = zeros(1,length(n)); % 이산시간만큼 시스템2의 충격응답 벡터를 생성

for i = 1:1:length(n) % 이산시간만큼
    for k = 1:1:length(p2_z)
         h2_n(i) = (r2_z(k) * (p2_z(k)^n(i))) + h2_n(i); % z역변환 연산(k는 현재 역변환 항의 번호)
    end
end

subplot(312) % 시스템2의 충격응답
stem(n,h2_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-10 10]);
ylabel('h2[n] system #2');


%실습 3.4 3번 시스템---------------------------------------------------------
sys3_zero_z = -5; % 시스템3의 zero점
sys3_pole_z = [1.5*exp((pi/4)*1j),1.5*exp(-(pi/4)*1j)]; % 시스템3의 pole점

[Q3_z,P3_z] = zp2tf(sys3_zero_z(:),sys3_pole_z(:),1); % 시스템3의 전달함수
P3_z =[P3_z 0]; % z역변환을 위해 분모의 지수를 1 늘려야함
[r3_z,p3_z,k] = residue(Q3_z(:),P3_z(:)); % 전달함수의 부분분수 전개
h3_n = zeros(1,length(n)); % 이산시간만큼 시스템3의 충격응답 벡터를 생성

for i = 1:1:length(n) % 이산시간만큼
    for k = 1:1:length(p3_z) %시스템3의 pole점의 개수 만큼
         h3_n(i) = (r3_z(k) * (p3_z(k)^n(i))) + h3_n(i); % z역변환 연산(k는 현재 역변환 항의 번호)
    end
end

subplot(313) % 시스템3의 충격응답
stem(n,h3_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-5000 10000]);
ylabel('h3[n] system #3');
xlabel('n');