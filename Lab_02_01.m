% Interpreting the FFT results

clc
close all
clear all

N = 256;                % FTT size
fc = 10;                % Frequency of the carrier signal
fs = 32*fc;             % Sampling frequency with oversampling factor 32
t = 0:1/fs:2-1/fs;      % Seconds duration

x = cos(2*pi*fc*t) + cos(2*pi*54*t);     % Time domain carrier signal (real number)

X = fft(x,N);           % N-point complex DFT, output contains DC at index 1
% Nyquist frequency at N/2+1 th index positive frequencies from index 2 to
% N/2 negative frequencies from index N/2+1 to N.

% Each in the FFT output array is spaced by the frequency resolution delta
% f -> = f_s/N = 1.25 Hz

% 10 Hz cosine signal will register a spike at the 8th sample (10/1.25 = 8)

%X_abs = abs(x)

df = fs/N;              % Frequency resolution
sampleIndex = 0:N-1;     % Raw index for FFT plot
f = sampleIndex*df;     % x-axis index converted to frequencies

subplot(3,1,1);
plot(t,x);
hold on;
title(['x[t] = cos(2\pi',num2str(fc),'t) + cos(2\pi',num2str(54),'t)'] );
xlabel('t = nT (s)')
ylabel('x(t)')

subplot(3,1,2);
stem(sampleIndex,abs(X));
title('X(k)');
xlabel('k');
ylabel('|X(k)|');

subplot(3,1,3);
stem(f,abs(X));
title('X(f)');
xlabel('f');
ylabel('|X(f)|');


%%% FFT Shift

% Two-sided FFT with negative frequecies on left and positive frequencies
% on right. This works only if N is even

X1 = [X(N/2+1:N) X(1:N/2)];         % Order frequencies without using fftShift
X2 = fftshift(X);                % order frequencies by using fftShift

df = fs/N;
sampleIndex = -N/2:N/2-1;       % raw index for FFT plot
f = sampleIndex*df;

figure;
subplot(2,1,1);
stem(sampleIndex,abs(X1));
hold on
stem(sampleIndex,abs(X2), 'b');
title('Frquency Domain ');
xlabel('k');
ylabel('|X(k)|');

subplot(2,1,2);
stem(f,abs(X1));
hold on
stem(f,abs(X2), 'b');
title('Frquencies (f) ');
xlabel('f');
ylabel('|X(f)|');


