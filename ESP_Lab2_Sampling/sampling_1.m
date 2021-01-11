clear;
clc;

t1 = -5;
t2 = 5;
fs = 20;
N = 4096;

ts = 1/fs;
t_a = linspace(t1,t2,10);

t = zeros(0,N);
p = zeros(0,N);

t_sub = zeros(1, fs);

n = 0;

for x = 1 : (t2-t1)*fs
    if t1 + n*ts < t2
        t_sub(x) = t1 + n*ts;
        n = n + 1;
    end
end
t_sub

% X = zeros(3896,1);
% Y = zeros((t2-t1)*fs,1);
% for n = 0 : (t2-t1)*fs - 1  
%     Y(n+1,:) = t1+(n*ts);
% end
% Y

% if find(X == 0)
%   X = [IdX ; 1];
% end

i = 1;

% fix( (N - n) / ((fs-1)*(t2-t1)) )
% b = [1 : fix( (N - n) / ((fs-1)*(t2-t1)) ) + 1 : 1 + ( (n-1)*( fix( (N - n) / ((fs-1)*(t2-t1)) ) + 1 ))]
% 1 + ( (n-1)*( fix( (N - n) / ((fs-1)*(t2-t1)) ) + 1 ))

for x = 1: fix( (N - n) / ((fs-1)*(t2-t1)) ) + 1 :N
    
    t(x) = t_sub(i);
    i = i + 1;
end

b = find(t);

t = [ ];
    for i = 1: length(find(t)) - 1
        z = linspace(t(b(i)),t(b(i+1)), fix( (N - n) / ((fs-1)*(t2-t1)) ) + 2);
        t = [ t (z) ];
    end
    t
    
%  for i = 1:length(find(t)) - 1
%     z_11 = zm(i,:);
%     for j = 1:N
%         if(z_11(j) == t_sub(i))
%             z_11(j) = 0;
%         end
%     end
%     zm(i,:) = z_11;
%  end

% t = sum(zm)
    
% for x = 1:N
%     if(mod(t(x),ts) == 0)
%         p(x) = 1;
%     else
%         p(x) = 0;
%     end
% end
% t
% figure(1)
% stem(t,p);

% [t, p] = impulse_train1(t1,t2,fs,N);
% 
% figure(1)
% stem(t,p)
