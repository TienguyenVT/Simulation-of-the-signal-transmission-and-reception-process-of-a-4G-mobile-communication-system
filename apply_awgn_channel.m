function y = apply_awgn_channel(x, snr_db)
% APPLY_AWGN_CHANNEL Apply AWGN channel to input signal
%   y = apply_awgn_channel(x, snr_db) applies AWGN to the input signal
%
%   Parameters:
%   - x: Input signal
%   - snr_db: Signal-to-Noise Ratio in dB
%
%   Returns:
%   - y: Output signal with AWGN

y = awgn(x, snr_db, 'measured');
end