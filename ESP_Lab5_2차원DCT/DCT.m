clear;
clc;

Z = myfun_LoadImage('lena.raw', 256, 256 );
% figure(1)
% imshow(Z);

% 2차원 DFT(FFT) 변환을 통한 이미지 처리
Y = (1/256)*fft2(Z);
Y_abs = abs(Y);
Y_uint8 = uint8(Y_abs);
figure(1)
imshow(Y_uint8);

Y_1 = uint8(abs((256*ifft2(Y))));
figure(2)
imshow(Y_1);
% 
% 
% 
% % 2차원 DCT 변환을 통한 이미지 처리
% Y_d = dct2(Z);
% Y_abs_d = abs(Y_d);
% Y_uint8_d = uint8(Y_abs_d);
% figure(3)
% imshow(Y_uint8_d);
% 
% Y_idct_d = uint8(idct2(Y_d));
% figure(4)
% imshow(Y_idct_d);



% 문턱값에 의한 이미지 압축

N = 0.5;   % threshold value N = 0.01, 0.1, 0.25, 0.5
Y_a = dct2(Z);
Y_Original = uint8(abs(Y_a));
Y_uint8_1 = uint8(abs(Y_a)); 
threshold = round(N*255); % 문턱값 정규화 (0~255)

for x = 1 :length(Y_uint8_1)
    for y = 1 :length(Y_uint8_1)
        if Y_uint8_1(x,y) <= threshold
              Y_uint8_1(x,y) = 0;
        end
    end
end

X = reshape(Y_uint8_1, 1,[]); % 원본 dct에서 문턱값을 통한 압축 처리 결과값
ind = find(X == 0);

X_1 = reshape(Y_a,1,[]);
for x = 1: length(ind)
    X_1(ind(x)) = 0;
end

X_f = reshape(X_1, 256, 256);
Y_thres_idct = uint8(idct2(X_f));

figure(1)
imshow(Y_uint8_1);

figure(2)
imshow(Y_thres_idct);




%%%%%%  압축률과 RMSE

% 압축률 구하는 과정

% ind_thershold = find(X);

X_original = reshape(Y_Original, 1, []); % 원본 dct 결과값
ind_original = find(X_original);

Original_find_ind = length(ind_original);
Thershold_find_ind = [60840, 36939, 11831, 5036, 1423, 550];
Thershold_value = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5];

Comperssion_ratio = zeros(1,6);
for x = 1:length(Comperssion_ratio)
    Comperssion_ratio(x) = Thershold_find_ind(x)/Original_find_ind;
end

% Thershold값에 따른 RMSE 구하는 과정
% Rmse = 0;
% for x = 1: length(Y)
%     for y = 1: length(Y)
%          Rmse = Rmse + (abs(double( Y_idct(x,y) - Y_thres_idct(x,y) )))^2;   
%     end
% end
% 
% RMSE_1 = sqrt((1/(256*256))*Rmse );

% RMSE = [0, 0.9043, 3.4278, 5.5838, 8.8347, 11.4458]; % 구한 RMSE 값
RMSE = [0, 0.9043, 3.2903, 4.6722, 6.0731, 7.0630];

figure(3)
semilogy(Thershold_value, Comperssion_ratio,'-or');
grid on;
ylim([10^-3 10^0]);

figure(4)
plot(Thershold_value, RMSE, '-sb');
grid on;




