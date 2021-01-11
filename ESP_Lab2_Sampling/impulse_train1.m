function [t, p] = impulse_train1( t1, t2, fs, N )

ts = 1/fs;

t_1value = abs(t2-t1)*fs;   % t1~t2사이에 fs(1초에 fs번)이 1초마다 총 몇 구간으로 나뉘는지 (= 1이 나오는 갯수) 
t_real1value = t_1value - 1;   % t1 + t_1value * ts == t2 -> 조건 만족하지 못함.

N_divided_by_1value = N / t_real1value; % 전체 인덱스 N을 ts 주기로 1의 값을 갖는 인덱스의 개수로 등분 

N_divided_by_1value = round(N_divided_by_1value); % 반올림 -> 한 ts 구간의 등분 개수

ts_distance = ts / N_divided_by_1value; % 한 ts 구간의 등분 개수간의 거리

ts_1 = t1 : ts_distance : t1+ts; % 첫번째 ts 구간(t1 ~ t1 + ts)의 값들

first_ts = zeros(1, length(ts_1) - 1);

first_ts = ts_1(1 : length(ts_1) - 1); % 첫번째 ts 구간 (마지막 값 t1 + ts를 뺌) 


total_ts = floor(N / length(first_ts)); % 전체 ts 구간(N에 근사) = length(first_ts) * total_ts

t = [ ]; 

for i = 0 : total_ts - 1 
    t = [ t  (first_ts + (i*ts)) ];
end

% last_t_value = N - length(t);

t = [ t  (t1 + ((i+1)*ts)) ];   % (t1 + ((i+1)*ts)) = t의 마지막 값 (N개 성립)

p = zeros(1, length(t));



for i = 1 : N_divided_by_1value : length(p)
    p(i) = 1;
end