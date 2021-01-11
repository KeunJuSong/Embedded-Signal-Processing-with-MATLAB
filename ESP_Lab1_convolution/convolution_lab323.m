clear;
clc;

n0 = 5;

n_1 = [0:15];
x_1 = cos(2*pi*0.1*n_1);

x_3 = cos(2*pi*0.1*(n_1-n0));

for i = 1:max(n_1) + 1
    if i > max(n_1) + 1 - n0
        x_3(i) = 0;
    end
end

n_2 = [0:5];
x_2 = (0.5).^n_2;

[n1, y1] = convolution(x_1,n_1,x_2,n_2);
[n2, y2] = convolution(x_3,n_1,x_2,n_2);

figure(1);
subplot(311)
stem(n_1,x_1,'filled');
xlabel('n');
ylabel('x[n]');
subplot(312)
stem(n_2,x_2,'filled');
xlabel('n');
ylabel('h[n]');
subplot(313)
stem(n1,y1,'filled');
xlabel('n');
ylabel('y[n]');

figure(2);
subplot(311)
stem(n_1,x_3,'filled', 'r');
xlabel('n');
ylabel('x[n-5]');
subplot(312)
stem(n_2,x_2,'filled');
xlabel('n');
ylabel('h[n]');
subplot(313)
stem(n2,y2,'filled', 'r');
xlabel('n');
ylabel('y[n]');