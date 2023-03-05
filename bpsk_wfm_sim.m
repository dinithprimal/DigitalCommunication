% Filename - bpsk_wfm_sim.m
% Demostrate of BPSK tx/rx chain (waveform simulation)

clearvars; clc;
close all;
clear all;

N = 10^6;           % Number of bits/symbols to transmitted
SNR = -4:2:10;      % Transmitted SNR values ar tx in dB for simulation
L = 16;             % Oversampling factor, L = Tb/Ts (Tb = bit period, Ts = Sampling Period)

% If a carrier signal is used, use L = Fs/Fc, where Fs >> 2*Fc

Fc = 800;           % Carrier Frequency
Fs = L*Fc;          % Sampling frequency

SNR_linear = 10.^(SNR/10);      % Converting dB values to linear scale

BER = zeros(length(SNR),1);     % for SER values for each SNR

data = rand(N,1)>0.5;           % Random generated 0's and 1's

[s_bb, t] = bpsk_mod(data, L);  % BPSK modulation (waveform) - baseband

s = s_bb.*cos(2*pi*Fc*t/Fs);    % with carrier

% Waveform at the transmitter
subplot(2,2,1);
plot(t,s_bb);       % baseband wave zoomed to first 10 bits
xlabel('t(s)');
ylabel('s_{bb}(t)-baseband');
xlim([0,10*L]);


subplot(2,2,2);
plot(t,s);       % baseband wave zoomed to first 10 bits
xlabel('t(s)');
ylabel('s(t)-with carrier');
xlim([0,10*L]);

% signal contellation at transmitter
subplot(2,2,3);
plot(real(s_bb),imag(s_bb),'o');
%xlabel('t(s)');
%ylabel('s(t)-with carrier'); 
xlim([-1.5,1.5]);
ylim([-1.5,1.5]);

for i = 1:length(SNR)
    
    Eb = L*sum(abs(s).^2)/length(SNR_linear);       % Signal Energy
    N0 = Eb/SNR_linear(i);
    n = sqrt(N0/2)*randn(1, length(s));             % Compute AWGN random noise
    
    y = s + n;              % Receives signal with noise
    
    r_bb = y.*cos(2*pi*Fc*t/Fs);                    % Receives baseband signal
    data_cap = bpsk_demod(r_bb, L);                 % Baseband corelation demodulator
    BER(i) = sum(data~=data_cap)/N;                  % Symbol error rate
    
    subplot(2,2,4);
    plot(t,y);       % baseband wave zoomed to first 10 bits
    xlabel('t(s)');
    ylabel('y(t)');
    xlim([0,10*L]);
    pause; % wait for keypass
    
end

theoriticalBER = 0.5*erfc(sqrt(SNR_linear));    % Theoritical BER

figure;
semilogy(SNR,BER,'k*'); % simulated BER
hold on;
semilogy(SNR,theoriticalBER, 'r-')
xlabel('SNR');
ylabel('BER');
legend('Simulated','Theoritical'); grid on;
title('BER for BPSK modulation');


