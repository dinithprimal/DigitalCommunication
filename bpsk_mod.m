% Filename - bpsk_mod.m
% Funciton to modulate incoming binary stream using BPSK (basband)
% data - Input binary data stream (0's and 1's) to modulate
% L - oversampling factor (Tb/Ts)
% s_bpsk - BPSK modulated signal (baseband)
% t - Generated time base for the modulated signal

function [s_bpsk, t] = bpsk_mod(data, L)
    
    N = length(data);               % Number of bits/symbol
    bpsk_sym = 2*data-1;            % BPSK modulation
    ai = repmat(bpsk_sym,1,L).';    % bit stream at Tb baund with rect pulse shape
    ai = ai(:).';                   % serialize
    t = 0:N*L-1;                    % Time base
    s_bpsk = ai;                    % BPSK modulated baseband signal

end



