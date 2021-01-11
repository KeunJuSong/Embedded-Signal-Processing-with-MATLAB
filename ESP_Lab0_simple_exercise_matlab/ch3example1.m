% clear;
% clc;
% 
% t = linspace(0, 2.5, 100);
% f = 1;
% y = cos( 2*pi*f*t );
% 
% figure(1)
% plot(t,y);
% grid on;
% 
% data = [t ; y];
% fid = fopen( 'cos_wave.txt','w' );
% fprintf( fid, '%f %f\n', data );
% fclose(fid);

clear;
clc;

d = load('cos_wave.txt');

%% exercise solution
plot(d(:,1),d(:,2))

mod_y = 2*d(:,2).*(d(:,2) > 0) + 0.5*d(:,2).*(d(:,2) <= 0);

figure(1);
hold on;
plot(d(:,1), mod_y, 'g*-');
legend('Original cos wave', 'Modified cos wave');
grid on;

