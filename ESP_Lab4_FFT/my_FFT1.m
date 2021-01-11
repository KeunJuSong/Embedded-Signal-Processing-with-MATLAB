function [f_hat,Xk,N_mult] = my_FFT1(x,N)

% 2. FFT ���� �׸���.

FFT_step = 1:log2(N);
N_mut = 0;


% 2-1 ȸ������
W_N = zeros(1 , length(FFT_step));
for k = 1 : length(FFT_step)
    W_N(k) = cos( (2*pi) / 2^(FFT_step(k)) ) - (1i*sin( (2*pi) / 2^(FFT_step(k))) );
end

FFT_matrix = zeros(N , log2(N)+1);


for k = 1 : N
    FFT_matrix(k,1) = x(k);
end



% step 1�ܰ�

r = FFT_matrix(:,1:2); %1,2�� ����� 

for y = 1:  2^(FFT_step(1)) :N % 2���� ���� ��Ŵ 1�ܰ��� ������ ��ŭ
    %v_1 = zeros(1, 2^(FFT_step(1)));
    D = r(y:y+ (2^(FFT_step(1))) - 1 , 1:2); %
    v_1 = x(1, y: y + ((2^(FFT_step(1))) - 1));
    v_2 = circshift( v_1 , ( 2^( FFT_step(1) ) ) / 2 );

       for z = 1: 2^(FFT_step(1) - 1)
           buffer = W_N(FFT_step(1))^(z-1) * v_2(z);
           N_mut = N_mut+1;
           D(z,2) = v_1(z) + buffer;
           D(z+2^(FFT_step(1) - 1),2) = v_1(z) - buffer;
       end
       
    r(y:y+ (2^(FFT_step(1))) - 1 , 1:2) = D; % y�߿� �� ������ �°� ���Ѱ� �ٽ� ����
end
 FFT_matrix(:,1:2) = r;

 
% step 2�ܰ� ����

for k = 2 : length(FFT_step)
    r = FFT_matrix(: , k:k+1 );
    
    for y = 1:  2^(FFT_step(k)) :N
        D = r(y:y+ (2^(FFT_step(k))) - 1 , 1:2);
        v_1 = r(y : y + ((2^(FFT_step(k))) - 1), 1);
        v_2 = circshift( v_1 , (2^(FFT_step(k))/2) );
        
        for z = 1: 2^(FFT_step(k) - 1)
           buffer = W_N(FFT_step(k))^(z-1) * v_2(z);
           N_mut = N_mut+1;
           D(z,2) = v_1(z) + buffer;
           D(z+2^(FFT_step(k) - 1),2) = v_1(z) - buffer;
        end
        
        r(y:y+ (2^(FFT_step(k))) - 1 , 1:2) = D;
    end
    FFT_matrix(:,k:k+1) = r;
end

Xk = zeros(1,N);

for k = 1 : N
    Xk(k) = FFT_matrix(k,end);
end

Xk = circshift(Xk, length(Xk)/2);

f_hat = linspace(0,(N-1)/(N),N);

f_hat = -0.5 + f_hat; 

N_mult = N_mut;
end