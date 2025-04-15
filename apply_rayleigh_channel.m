function [y, h] = apply_rayleigh_channel(x, snr_db)
% APPLY_RAYLEIGH_CHANNEL Apply Rayleigh fading channel to input signal
%   [y, h] = apply_rayleigh_channel(x, snr_db) applies Rayleigh fading and
%   noise to the input signal
%
%   Parameters:
%   - x: Input signal
%   - snr_db: Signal-to-Noise Ratio in dB
%
%   Returns:
%   - y: Output signal with Rayleigh fading and noise
%   - h: Channel coefficients

num_samples = length(x);

% Generate Rayleigh fading coefficients
h = (randn(num_samples, 1) + 1j*randn(num_samples, 1))/sqrt(2);

% Generate complex noise
noise = (randn(num_samples, 1) + 1j*randn(num_samples, 1))/sqrt(2);

% Calculate noise power based on SNR
noise_power = 1/(10^(snr_db/10));

% Apply Rayleigh fading and add noise
y = h.*x + sqrt(noise_power)*noise;
end