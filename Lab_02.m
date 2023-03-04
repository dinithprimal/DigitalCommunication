clc
clear all
close all

fs= 80;                    % Sampling Frquency
sigma_g1 = 0.1;            % Standard Deiation for wave 01

sigma_g2 = 0.07;           % Standard Deiation for wave 02

t = -0.5:1/fs:0.5;

g1 = 1/(sqrt(2*pi)*sigma_g1)*(exp(-t.^2/(2*sigma_g1^2))); 

g2 = (1/(sqrt(2*pi)*sigma_g2))*(exp(-t.^2/(2*sigma_g2^2)));


plot(t,g1)
hold on
plot(t,g2)
title(['Gaussian Pulses'])
legend(['\sigma_{',num2str(1),'} = ',num2str(sigma_g1)],['\sigma_{',num2str(2),'} = ',num2str(sigma_g2)]);
xlabel('Time (s)')
ylabel('Amplitude')


