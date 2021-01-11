clear;
clc;

tau = 0.3;

x_int = [0:5];

x = linspace(0,5,10000);
y = zeros(1, length(x));

for i = 1:length(x)
    for j = 1:length(x_int)
        if(x(i) >= x_int(j) - tau && x(i) <= x_int(j) + tau)
            y(i) = 1;
        end
    end
end

plot(x,y);
grid on;
xlabel('X');
ylabel('Y');
ylim([0 1.2]);