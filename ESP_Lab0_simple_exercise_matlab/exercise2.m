clear;
clc;

%%% for���� ����� ��� %%%

for x=0:4

% X���� ����(0 ���� 5����)
t1 = linspace(x,0.3+x,5);
t2 = linspace(0.3+x,0.7+x,5);
t3 = linspace(0.7+x,1+x,5);

% X�࿡ ���� Y�� ��
y1 = 1./t1.*t1;
y2 = 0.*t2;
y3 = 1./t3.*t3;

% X�� ���� ���͵�� Y�� ���� ���͵� ��ġ��
t = [t1 t2 t3];
y = [y1 y2 y3];

figure(1);
plot(t,y,'b');
hold on;
end

grid on;
ylabel('Y');
xlabel('X');
ylim([0 1.2]);


%%% for���� ������� �ʴ� ��� %%%

t1 = linspace(0,0.3,5);
t2 = linspace(0.3,0.7,5);
t3 = linspace(0.7,1,5);

y1 = 1./t1.*t1;
y2 = 0.*t2;
y3 = 1./t3.*t3;

t = [t1 t2 t3];
y = [y1 y2 y3];

figure(2);
plot(t,y,'r'); 
hold on;

t1 = linspace(1,1.3,5);
t2 = linspace(1.3,1.7,5);
t3 = linspace(1.7,2,5);

y1 = 1./t1.*t1;
y2 = 0.*t2;
y3 = 1./t3.*t3;

t = [t1 t2 t3];
y = [y1 y2 y3];
plot(t,y,'r');

t1 = linspace(2,2.3,5);
t2 = linspace(2.3,2.7,5);
t3 = linspace(2.7,3,5);

y1 = 1./t1.*t1;
y2 = 0.*t2;
y3 = 1./t3.*t3;

t = [t1 t2 t3];
y = [y1 y2 y3];
plot(t,y,'r');

t1 = linspace(3,3.3,5);
t2 = linspace(3.3,3.7,5);
t3 = linspace(3.7,4,5);

y1 = 1./t1.*t1;
y2 = 0.*t2;
y3 = 1./t3.*t3;

t = [t1 t2 t3];
y = [y1 y2 y3];
plot(t,y,'r');

grid on;

ylabel('Y');
xlabel('X');
ylim([0 1.2]);





    


