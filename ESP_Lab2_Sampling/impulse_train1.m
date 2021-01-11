function [t, p] = impulse_train1( t1, t2, fs, N )

ts = 1/fs;

t_1value = abs(t2-t1)*fs;   % t1~t2���̿� fs(1�ʿ� fs��)�� 1�ʸ��� �� �� �������� �������� (= 1�� ������ ����) 
t_real1value = t_1value - 1;   % t1 + t_1value * ts == t2 -> ���� �������� ����.

N_divided_by_1value = N / t_real1value; % ��ü �ε��� N�� ts �ֱ�� 1�� ���� ���� �ε����� ������ ��� 

N_divided_by_1value = round(N_divided_by_1value); % �ݿø� -> �� ts ������ ��� ����

ts_distance = ts / N_divided_by_1value; % �� ts ������ ��� �������� �Ÿ�

ts_1 = t1 : ts_distance : t1+ts; % ù��° ts ����(t1 ~ t1 + ts)�� ����

first_ts = zeros(1, length(ts_1) - 1);

first_ts = ts_1(1 : length(ts_1) - 1); % ù��° ts ���� (������ �� t1 + ts�� ��) 


total_ts = floor(N / length(first_ts)); % ��ü ts ����(N�� �ٻ�) = length(first_ts) * total_ts

t = [ ]; 

for i = 0 : total_ts - 1 
    t = [ t  (first_ts + (i*ts)) ];
end

% last_t_value = N - length(t);

t = [ t  (t1 + ((i+1)*ts)) ];   % (t1 + ((i+1)*ts)) = t�� ������ �� (N�� ����)

p = zeros(1, length(t));



for i = 1 : N_divided_by_1value : length(p)
    p(i) = 1;
end