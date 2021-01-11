function [ n , y ] = convolution(x1,n1,x2,n2)

%%% convolution - n값 범위 연산
n_ynum = length(n1) + length(n2) - 1;

y = zeros(0,n_ynum);
n = zeros(0,n_ynum);

n_first = min(n1) - max(n2.*-1);

for i = 1:n_ynum
    n(i) = n_first;
    n_first = n_first + 1;
end

%%% convolution - y[n]값 결과 연산
x2_minus_k = fliplr(x2);

x1_zerom = zeros(1, n_ynum - length(x1));
x1_m = [x1_zerom x1];
x2_zerom = zeros(1, n_ynum - length(x2));
x2_m = [x2_minus_k x2_zerom];

for i = 1 : n_ynum
    calc_m = [x1_m ; circshift(x2_m,i-1)];
    y(i) = sum(prod(calc_m));
end