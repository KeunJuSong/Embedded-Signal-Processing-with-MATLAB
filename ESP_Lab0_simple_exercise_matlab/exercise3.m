clear;
clc;

for x=0:1
t1 = linspace(x,0.3+x,100);
t2 = linspace(0.3+x,0.7+x,100);
t3 = linspace(0.7+x,1+x,100);

y1 = 1./t1.*t1;
y2 = 0.*t2;
y3 = 1./t3.*t3;

t = [t1 t2 t3];
y = [y1 y2 y3];

figure(1);
subplot(211)
plot(t,y,'b');

xlabel('X');
ylabel('Y');

hold on;
grid on;
ylim([0 1.2]);
end


for x=0:1
    t1_c = linspace(x,0.3+x,100);
    t2_c = linspace(0.3+x,0.7+x,100);
    t3_c = linspace(0.7+x,1+x,100);
    
    in1 = find(y);
    in2 = find(y == 0);
    
    y_c2 = cos(2*pi*5*t2_c);
    y_c11 = cos(2*pi*5*t1_c + pi);
    y_c12 = cos(2*pi*5*t3_c + pi);
    
    if y(in2) == 0     
        subplot(212) 
        plot(t2_c,y_c2,'b');
        hold on;
    end
    
    if y(in1) == [y1 y3]
        subplot(212)
        plot([t1_c t2_c],[y_c11 y_c2],'b');
        hold on;
        plot([t2_c t3_c],[y_c2 y_c12],'b');
    end
    
    xlabel('X');
    ylabel('Y');
    
    grid on;
end
