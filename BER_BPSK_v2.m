% Filename - BER_BPSK_v2.m
% BER simulation of BPSK

clear all;
close all;
clc;

N = 10^6;               % Number of bits
data = rand(1,N)>0.5;   % Randomly generated data vector
signal = 2*data-1;     % BPSK modulation 0->-1, 1->1

n = (1/sqrt(2))*[randn(1,N)+j*randn(1,N)];      % AWGN

SNR = [-3:10];          % Simulated SNR range

for i = 1:length(SNR)
    
    y = signal + 10^(-SNR(i)/20)*n;             % Received signal with noise
    
    % receiver - hard decision decoding
    r_data = real(y)>0;
    
    % Count errors
    nErr(i) = size(find([data-r_data]),2);
    
end

simBER = nErr/N;        % Simulated BER
theoriticalBER = 0.5*erfc(sqrt(10.^(SNR/10)));  % Theoritical BER

figure;
semilogy(SNR, theoriticalBER, 'b.-');
hold on;
semilogy(SNR, simBER, 'mx-')
xlabel('SNR (dB)')
ylabel('BER')
legend('Theoritical BER', 'Simulated BER')
grid on;
title('BER of BPSK Modulation')



% % Rayleigh Channel
% 
% function h = calcCOE(N)
%     x = randn(1,N)/sqrt(2);
%     y = randn(1/N)/sqrt(2);
%     h = sqrt(x.^2 + y.^2);
% 
% end
% 
% % AWGN Noise
% function n = calcAWGN(N)
%     n = (1/sqrt(2).*[randn(1,N)+j*randn(1,N]);
% end