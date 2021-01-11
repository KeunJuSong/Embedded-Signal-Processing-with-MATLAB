clc;
clear;


% �ǽ� 3.1�� ù��°----------------------------------------------------------
zero_vec_s = roots([1 5]); % ���ڽ��� ��(zero��) �ǵ��� s�� s�����̶���(���ö� ����ȯ)
pole_vec_s = roots([1 2 5]); % �и���� ��(pole��)

figure(1) % pole-zero plot (s����)
plot(real(pole_vec_s), imag(pole_vec_s), 'rx');
hold on;
plot(real(zero_vec_s), imag(zero_vec_s), 'bo');
grid on;
ylim([-2.5 2.5]);
xlim([-5.3 0]);
xlabel('Real(s)');
ylabel('Imag(s)');
title('�ǽ�3.1 ù��°');


% �ǽ� 3.1�� �ι�°----------------------------------------------------------
[r_s,p_s,k] = residue([1 5],[1 2 5]); % p_s�� pole�� r_s�� �׳ɻ��(zero���� �ƴ�)
t = 0: 0.01: 10; % ���ӽð� 0~10
h_t = zeros(1,length(t)); % ���ӽð���ŭ ������� ���͸� ����

for i = 1:1:length(t) % ���ӽð���ŭ �ݺ�
    for k = 1:1:length(p_s) % pole���� ������ŭ �ݺ�(���ö� ����ȯ ���� ����)
         h_t(i) = (r_s(k) * exp(p_s(k)*t(i))) + h_t(i); % ���ö󽺿���ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

figure(2) %�������
plot(t,h_t);
grid on;
ylim([-0.4 1.6]);
xlabel('t[sec]');
ylabel('h(t)');
title('�ǽ�3.1 �ι�°');


%�ǽ� 3.1�� ����°-----------------------------------------------------------
w = -4: 0.001 : 4; % ���ļ� ���� ����
H_w = zeros(1,length(w)); % ���ļ� ���ͼ���ŭ ���ļ����� ���� ����

for i = 1:1:length(w) %������ w(���ļ�)����
    wj = w(i)*1j;
    Q = 1; % ���� ����
    P = 1; % �и� ����
    
    for k = 1:1:length(zero_vec_s) % ���� w(���ļ�)�϶� ���� ���(zero�� ������ŭ ��)
        Q = (wj - zero_vec_s(k)) * Q;
    end
    
    for m = 1:1:length(pole_vec_s) % ���� w(���ļ�)�϶� �и� ���(pole�� ������ŭ ��)
        P = (wj - pole_vec_s(m)) * P;
    end
    
    H_w(i) = Q/P; % ���� w(���ļ�)�� ���ļ�����
end

figure(3) % ���ļ� ����
plot(w,abs(H_w));
grid on;
xlabel('Frequency w [rad/sec]');
ylabel('|H(w)|');
title('�ǽ�3.1 ����°');


%�ǽ� 3.2 ù ��° 1�� �ý���-------------------------------------------------
sys1_zero = -5; % �ý���1�� zero��
sys1_pole = [-2j-1,2j-1]; % �ý���1�� pole��

[Q1,P1] = zp2tf(sys1_zero(:),sys1_pole(:),1); % �ý���1�� �����Լ�
[r1_s,p1_s,k] = residue(Q1(:),P1(:)); % �����Լ��� �κкм� ����
h1_t = zeros(1,length(t)); % ���ӽð���ŭ �ý���1�� ������� ���͸� ����

for i = 1:1:length(t) % ���ӽð���ŭ
    for k = 1:1:length(p1_s) % �ý���1�� pole���� ���� ��ŭ
         h1_t(i) = (r1_s(k) * exp(p1_s(k)*t(i))) + h1_t(i); % ���ö󽺿���ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

figure(4) % �ý���1�� �������
subplot(311)
plot(t,h1_t);
grid on;
ylim([-0.5 1.5]);
ylabel('h1(t) system #1');
title('�ǽ�3.2');


%�ǽ� 3.2 ù ��° 2�� �ý���-------------------------------------------------
sys2_zero = -5; % �ý���2�� zero��
sys2_pole = [-2j,2j]; % �ý���2�� pole��

[Q2,P2] = zp2tf(sys2_zero(:),sys2_pole(:),1); % �ý���2�� �����Լ�
[r2_s,p2_s,k] = residue(Q2(:),P2(:)); % �����Լ��� �κкм� ����
h2_t = zeros(1,length(t)); % ���ӽð���ŭ �ý���2�� ������� ���͸� ����

for i = 1:1:length(t) % ���ӽð���ŭ
    for k = 1:1:length(p2_s) % �ý���2�� pole���� ���� ��ŭ
         h2_t(i) = (r2_s(k) * exp(p2_s(k)*t(i))) + h2_t(i); % ���ö󽺿���ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

subplot(312) % �ý���2�� �������
plot(t,h2_t);
ylim([-4 4]);
ylabel('h2(t) system #2');


%�ǽ� 3.2 ù ��° 3�� �ý���-------------------------------------------------
sys3_zero = -5; % �ý���3�� zero��
sys3_pole = [-2j+1,2j+1]; % �ý���3�� pole��

[Q3,P3] = zp2tf(sys3_zero(:),sys3_pole(:),1); % �ý���3�� �����Լ�
[r3_s,p3_s,k] = residue(Q3(:),P3(:)); % �����Լ��� �κкм� ����
h3_t = zeros(1,length(t)); % ���ӽð���ŭ �ý���3�� ������� ���͸� ����

for i = 1:1:length(t) % ���ӽð���ŭ
    for k = 1:1:length(p3_s) % �ý���3�� pole���� ���� ��ŭ
         h3_t(i) = (r3_s(k) * exp(p3_s(k)*t(i))) + h3_t(i); % ���ö󽺿���ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

subplot(313) % �ý���3�� �������
plot(t,h3_t);
%ylim([-5 10*10^4]);
%axis([0 10 -5 10^5]);
axis auto;
ylabel('h3(t) system #3');
xlabel('t[sec]');


%�ǽ� 3.3 ù ��°------------------------------------------------------------
zero_vec_z = roots([1 -0.3]); %���ڽ��� ��(zero��) �ǵ��� z�� z�����̶���(z ����ȯ)
pole_vec_z = roots([1 0.3 0.36 0.108]); %�и���� ��(pole��)

% ���׸���
center = [0,0]; % �߽�
radius = 1; % ������ ����
dot_cir = linspace(0, 2*pi, 100); % ���� �̷�� ������ ����
x = radius*cos(dot_cir) + center(1);
y = radius*sin(dot_cir) + center(2);
%���� �ν����� ���� �׸�

figure(5) % pole-zero plot (z����)
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
title('�ǽ�3.3 ù��°');


% �ǽ� 3.3�� �ι�°----------------------------------------------------------
[r_z,p_z,k] = residue([1 -0.3],[1 0.3 0.36 0.108 0]); % p_z�� pole�� r_z�� �׳ɻ��(zero���� �ƴ�)
% �����Լ� �и��� ������ 1 �÷������ �׷��� �� �������� 0�� �־���(�߿� z����ȯ�ϱ� ���ؼ���)
n = 0: 1: 20; % �̻�ð� 0~20�̻�ð���ŭ ������� ���͸� ����
h_n = zeros(1,length(n)); % 

for i = 1:1:length(n) % �̻�ð���ŭ �ݺ�
    for k = 1:1:length(p_z) % pole���� ���� ��ŭ �ݺ�(z��ȯ�� ����ȯ�� ����)
         h_n(i) = (r_z(k) * (p_z(k)^n(i))) + h_n(i); % z����ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

figure(6) % �������
stem(n,h_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-0.6 1]);
xlabel('n');
ylabel('h[n]');
title('�ǽ�3.3 �ι�°');


%�ǽ� 3.3�� ����°-----------------------------------------------------------
PI = -pi: 0.01 : pi; % ���ļ� ���� ����
H_PI = zeros(1,length(PI)); %���ļ��� ���ͼ���ŭ ���ļ����� ���� ����

for i = 1:1:length(PI) %������ PI(���ļ�)����
    PIj = exp(PI(i)*1j);
    Q_z = 1; % ���� ����
    P_z = 1; % �и� ����
    
    for k = 1:1:length(zero_vec_z) % ���� PI(���ļ�)�϶� ���� ���(zero�� ������ŭ ��)
        Q_z = (PIj - zero_vec_z(k)) * Q_z;
    end
    
    for m = 1:1:length(pole_vec_z) % ���� PI(���ļ�)�϶� �и� ���(pole�� ������ŭ ��)
        P_z = (PIj - pole_vec_z(m)) * P_z;
    end
    
    H_PI(i) = Q_z/P_z; % ���� PI(���ļ�)�� ���ļ�����
end

figure(7) % ���ļ� ����
plot(PI,abs(H_PI));
grid on;
xlim([-pi pi]);
xlabel('Frequency PI [rad]');
ylabel('|H(PI)|');
title('�ǽ�3.3 ����°');


%�ǽ� 3.4 1�� �ý���---------------------------------------------------------
sys1_zero_z = -5; % �ý���1�� zero��
sys1_pole_z = [0.5*exp((pi/4)*1j),0.5*exp(-(pi/4)*1j)]; % �ý���1�� pole��

[Q1_z,P1_z] = zp2tf(sys1_zero_z(:),sys1_pole_z(:),1); % �ý���1�� �����Լ�
P1_z =[P1_z 0]; % z����ȯ�� ���� �и��� ������ 1 �÷�����
[r1_z,p1_z,k] = residue(Q1_z(:),P1_z(:)); % �����Լ��� �κкм� ����
h2_n = zeros(1,length(n)); % �̻�ð���ŭ �ý���1�� ������� ���� ����

for i = 1:1:length(n) % �̻�ð���ŭ
    for k = 1:1:length(p1_z) % �ý���1�� pole���� ���� ��ŭ
         h2_n(i) = (r1_z(k) * (p1_z(k)^n(i))) + h2_n(i); % z����ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

figure(8) % �ý���1�� �������
subplot(311)
stem(n,h2_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-2 6]);
ylabel('h1[n] system #1');
title('�ǽ�3.4');


%�ǽ� 3.4 2�� �ý���---------------------------------------------------------
sys2_zero_z = -5; % �ý���2�� zero��
sys2_pole_z = [exp((pi/4)*1j),exp(-(pi/4)*1j)]; % �ý���2�� pole��

[Q2_z,P2_z] = zp2tf(sys2_zero_z(:),sys2_pole_z(:),1); % �ý���2�� �����Լ�
P2_z =[P2_z 0]; % z����ȯ�� ���� �и��� ������ 1 �÷�����
[r2_z,p2_z,k] = residue(Q2_z(:),P2_z(:)); % �����Լ��� �κкм� ����
h2_n = zeros(1,length(n)); % �̻�ð���ŭ �ý���2�� ������� ���͸� ����

for i = 1:1:length(n) % �̻�ð���ŭ
    for k = 1:1:length(p2_z)
         h2_n(i) = (r2_z(k) * (p2_z(k)^n(i))) + h2_n(i); % z����ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

subplot(312) % �ý���2�� �������
stem(n,h2_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-10 10]);
ylabel('h2[n] system #2');


%�ǽ� 3.4 3�� �ý���---------------------------------------------------------
sys3_zero_z = -5; % �ý���3�� zero��
sys3_pole_z = [1.5*exp((pi/4)*1j),1.5*exp(-(pi/4)*1j)]; % �ý���3�� pole��

[Q3_z,P3_z] = zp2tf(sys3_zero_z(:),sys3_pole_z(:),1); % �ý���3�� �����Լ�
P3_z =[P3_z 0]; % z����ȯ�� ���� �и��� ������ 1 �÷�����
[r3_z,p3_z,k] = residue(Q3_z(:),P3_z(:)); % �����Լ��� �κкм� ����
h3_n = zeros(1,length(n)); % �̻�ð���ŭ �ý���3�� ������� ���͸� ����

for i = 1:1:length(n) % �̻�ð���ŭ
    for k = 1:1:length(p3_z) %�ý���3�� pole���� ���� ��ŭ
         h3_n(i) = (r3_z(k) * (p3_z(k)^n(i))) + h3_n(i); % z����ȯ ����(k�� ���� ����ȯ ���� ��ȣ)
    end
end

subplot(313) % �ý���3�� �������
stem(n,h3_n,'MarkerEdgeColor','b','MarkerFaceColor','b');
grid on;
ylim([-5000 10000]);
ylabel('h3[n] system #3');
xlabel('n');