function [ x, y ] = make_circle(center_x, center_y, r)

t = linspace(0,2*pi,100);

x = r*cos(t) + center_x; 
y = r*sin(t) + center_y;
