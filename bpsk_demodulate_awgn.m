function y_bits = bpsk_demodulate_awgn(y)
% BPSK_DEMODULATE_AWGN BPSK demodulation for AWGN channel
%   y_bits = bpsk_demodulate_awgn(y) demodulates BPSK signal in AWGN channel
%
%   Parameters:
%   - y: Received signal
%
%   Returns:
%   - y_bits: Demodulated bits

y_bits = (y > 0);
end