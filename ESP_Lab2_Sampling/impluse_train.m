function [t, p] = impluse_train(t1,t2,fs,N)

ts = 1/fs;

t_sub = zeros(1, fs);

n = 0;

while(t1 + n*ts < t2)
    t_sub(n+1) = t1 + n*ts;
    n = n + 1;
end

zm = zeros(n-1,N);

for i = 1:n-1
    t_1 = linspace(t_sub(i),t_sub(i+1), 2+(N-fs)/(n-1));
    
    t_z = zeros(1, N - fs);

    t_1z = [t_1 t_z];
    
    t_1s = circshift(t_1z, (i-1)*(n-1));
    
    zm(i,:) = t_1s;
end

for i = 1:n-1
    t_11 = zm(i,:);
    for j = 1:N
        if(t_11(j) == t_sub(i))
            t_11(j) = 0;
        end
    end
    zm(i,:) = t_11;
end

t = sum(zm);

for x = 1:N
    if(mod(t(x),ts) == 0)
        p(x) = 1;
    else
        p(x) = 0;
    end
end

end