function y_bits = bpsk_demodulate_rayleigh(y, h)
% BPSK_DEMODULATE_RAYLEIGH BPSK demodulation for Rayleigh channel
%   y_bits = bpsk_demodulate_rayleigh(y, h) demodulates BPSK signal in
%   Rayleigh fading channel with channel state information
%
%   Parameters:
%   - y: Received signal
%   - h: Channel coefficients
%
%   Returns: 
%   - y_bits: Demodulated bits

% Maximal ratio combining
y_bits = (real(conj(h).*y) > 0);
end