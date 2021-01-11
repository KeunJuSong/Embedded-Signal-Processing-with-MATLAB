clear;
clc;

n1 = [-2:2];
x1 = cos(pi*n1);

n2 = [0:3];
x2 = (0.5).^n2;

% figure(1)
% stem(n2,x2,'filled');
% xlim([-5 4]);
% xlabel('n');
% ylabel('x2[n]');

n3 = [-1:2];
x3 = 2.*n3;

% figure(2)
% stem(n3,x3,'filled');
% xlabel('n');
% ylabel('x3[n]');

%%% convolution - n값 범위 연산
% n_ynum = length(n1) + length(n2) - 1;
% 
% y = zeros(1,n_ynum);
% n = zeros(1,n_ynum);
% 
% n_first = min(n1) - max(n2.*-1);
% n_first_sub = n_first;
% 
% for i = 1:n_ynum
%     n(i) = n_first;
%     n_first = n_first + 1;
% end

%%% x1[k]
% k1 = [min(n2.*-1) + n_first_sub:max(n1)];
% x1_zerom = zeros(1, n_ynum - length(x1));
% x1_m = [x1_zerom x1];
% figure(1)
% stem(k1,x1_m, 'filled');
% xlabel('n');
% ylabel('x1[n]');
% xlim([-5 4]);

%%% x2[n-k]
% x2_minus_k = fliplr(x2);
% x2_zerom = zeros(1, n_ynum - length(x2));
% x2_m = [x2_minus_k x2_zerom];
% z = circshift(x2_m,0);
% figure(1)
% stem(k1,z, 'filled');
% xlabel('k');
% ylabel('x2[5-k]');
% ylim([0 1]);
% xlim([-5 4]);

%%% x1[k]*x2[n-k]
% z = circshift(x2_m,0);
% % z(1) = 0;
% % z(2) = 0;
% % z(3) = 0;
% calc_m = [x1_m ; z];
% calc_m1 = prod(calc_m);
% % figure(1)
% % stem(k1,calc_m1,'filled');
% % xlabel('k');
% % ylabel('x1[k]*x2[5-k]');
% % xlim([-5 4]);

% %%% y[n], y(n) n 범위 하나당
% y(1) = sum(calc_m1);
% % figure(1)
% % stem(n,y,'filled');
% % xlabel('n');
% % ylabel('sigma x1[k]*x2[n-k]');

%%% y[n], 최종 컨벌루젼
% for i = 1 : n_ynum
%     calc_m = [x1_m ; circshift(x2_m,i-1)];
%     y(i) = sum(prod(calc_m));
% end
[n_c, y_c] = convolution(x1,n1,x2,n2);
figure(2)
stem(n_c,y_c,'filled');
xlabel('n');
ylabel('y1[n] = x1[n]*x2[n]');


n_ynum = length(n_c) + length(n3) - 1;

y = zeros(1,n_ynum);
n = zeros(1,n_ynum);

n_first = min(n_c) - max(n3.*-1);
n_first_sub = n_first;

for i = 1:n_ynum
    n(i) = n_first;
    n_first = n_first + 1;
end


%%% y1[k]
k1 = [min(n3.*-1) + n_first_sub:max(n_c)];
y_c_zerom = zeros(1, n_ynum - length(y_c));
y_c_m = [y_c_zerom y_c];
% figure(1)
% stem(k1,y_c_m, 'filled');
% xlabel('k');
% ylabel('y1[k]');

%%% x3[n-k]
x3_minus_k = fliplr(x3);
x3_zerom = zeros(1, n_ynum - length(x3));
x3_m = [x3_minus_k x3_zerom];
z = circshift(x3_m,0);
% z(1) = 0;
% z(2) = 0;
% z(3) = 0;
% figure(1)
% stem(k1,z, 'filled');
% xlabel('k');
% ylabel('x3[-3-k]');

%%% y1[k]*x3[n-k]
z = circshift(x3_m,0);
% z(1) = 0;
% z(2) = 0;
% z(3) = 0;
calc_m = [y_c_m ; z];
calc_m1 = prod(calc_m);
% figure(1)
% stem(k1,calc_m1,'filled');
% xlabel('k');
% ylabel('y1[k]*x2[-3-k]');

%%% y[n], y(n) n 범위 하나당
y(11) = sum(calc_m1);
% figure(1)
% stem(n,y,'filled');
% xlabel('n');
% ylabel('sigma y1[k]*x3[-3-k]');

%%% y[n], 최종 컨벌루젼
[n_fc, y_fc] = convolution(y_c,n_c,x3,n3);
figure(2)
stem(n_fc,y_fc,'filled');
xlabel('n');
ylabel('Y[n] = y1[n]*x3[n]');
