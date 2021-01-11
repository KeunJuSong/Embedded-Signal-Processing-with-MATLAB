clear;
clc;

center=[5 10];                   
r=10;                                                           
t=linspace(0,2*pi,100);  
x = r*cos(t) + center(1); 
y = r*sin(t) + center(2);  
plot(x,y);              
ylim([0 20]);

xlabel('X');
ylabel('Y');
grid on;