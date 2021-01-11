function [f_hat,Xk,N_mult] = my_DFT(x,N)

Xk = zeros(1,N);

Xk_sub = [ ];

N_mult = 0;

for k = 0 : N-1
        Xk_sub = [ ];
    for i = 0:N-1
        Xk_sub = [Xk_sub  ( x(i+1)*( cos((2*pi*i*k)/N) - (1i*sin((2*pi*i*k)/N)) ) )];
        N_mult = N_mult + 1;
    end
    Xk(k+1) = sum(Xk_sub);
end

Xk = circshift(Xk, length(Xk)/2);

f_hat = linspace(0,(N-1)/(N),N);

f_hat = -0.5 + f_hat; 

end