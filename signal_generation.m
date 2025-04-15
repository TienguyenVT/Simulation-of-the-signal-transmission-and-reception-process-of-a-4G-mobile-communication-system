function [x, x_bits] = signal_generation(num_samples)
% SIGNAL_GENERATION Generate BPSK modulated signal
%   [x, x_bits] = signal_generation(num_samples) returns a BPSK modulated
%   signal and the original bits
%
%   Parameters:
%   - num_samples: Number of samples to generate
%
%   Returns:
%   - x: BPSK modulated signal (-1, +1)
%   - x_bits: Original bits (0, 1)

% Generate random bits
x_bits = randi([0 1], num_samples, 1);

% BPSK modulation
x = 2*x_bits - 1;
end