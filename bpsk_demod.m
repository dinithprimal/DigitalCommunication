% Filename - bpsk_demod.m
% Funciton to demodulate a BPSK signal (baseband)
% r_bb - received signal at the reciever front end (baseband)
% N - number of symbols/bit transmitted
% L - oversampling factor (tsym/Ts)
% r_data - detected binary stream

function [r_data] = bpsk_demod(r_bb, L)
    x = real(r_bb);
    x = conv(x, ones(1, L));       % Intergrate for L (Tb) duration
    x = x(L:L:end);                 % Sample at every L
    r_data = (x>0).';               % Threshold detector
end