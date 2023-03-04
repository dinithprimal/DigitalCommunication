%% Sine Wave

clear all;
close all;
clc;

f = 10;                     % Frequency of sine wave
overSampleRate = 30;        % Oversampling rate
fs = overSampleRate*f;      % Sampling frequency
phase = (1/3)*pi;           % Desired phase shift in radians
nCyl = 5;                   % To generate five cycle of sine waves

%t = 0:0.1:1;               % time base
t = 0:1/fs:nCyl*((1/f)-(1/fs));

ySine = sin(2*pi*f*t + phase);

subplot(2,1,1);
plot(t,ySine);
title(['Sine Wave f=', num2str(f), 'Hz'])
xlabel('Time (s)')
ylabel('Amplitude')

%% Sqaure Wave

f = 10;                     % Frequency of sine wave
overSampleRate = 30;        % Oversampling rate
fs = overSampleRate*f;      % Sampling frequency
nCyl = 5;                   % To generate five cycle of sine waves

ySqaure = sign(sin(2*pi*f*t));

subplot(2,1,2);
plot(t,ySqaure);
title(['Sqaure Wave f=', num2str(f), 'Hz'])
xlabel('Time (s)')
ylabel('Amplitude')


