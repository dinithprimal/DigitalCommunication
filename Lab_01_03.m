clc;
clear all;
close all;

% Chirp Sigals:
% Applications:
%       Sonar, Radar, Spread Spectrum, Optical Communicatin, Image
%       Processing, Dopler Effect, Motion of Pendulum, Gravitaional Waves

%Up - Chirp -> Frequency Low to High
%Low - Chirp -> Frequency High to Low

fs = 500;               % Sampling Frequency
t = 0:1/fs:1;           % time-base - upto 1 second
f0 = 50;                 % Starting frequency of the chirp
f1 = fs/100;             % Frequency of the chirp signal, at t1=1 second

y = chirp_signal(t, f0, 1, f1);

plot(t,y)
title('Chirp Sigal')

function g = chirp_signal(t, f0, t1, f1, phase)
    % g = chirp_signal(t, f0, t1, f1, phase) generates samples of a
    % linearly swept-frequency signal at the time instances defined in
    % timebase array t. The instantaneous frequency at time 0 is f0 Hz. The
    % instantaneous frequency f1 is achieved at time t1. The arfument
    % 'phase' is optional. It defines the initial phase of the signal
    % defined i radians. By default phase = 0 radian.
    
    if nargin==4
        phase = 0;
    end
    
    t0 = t(1);
    T = t1 - t0;
    k = (f1 - f0)/T;
    
    g = cos(2*pi*(((k/2)*t)+f0).*t+phase);
    
end