function ber = theoretical_ber_rayleigh(snr_db)
% THEORETICAL_BER_RAYLEIGH Calculate theoretical BER for Rayleigh channel
%   ber = theoretical_ber_rayleigh(snr_db) returns theoretical BER for
%   BPSK in Rayleigh fading channel
%
%   Parameters:
%   - snr_db: Signal-to-Noise Ratio in dB
%
%   Returns:
%   - ber: Theoretical Bit Error Rate for Rayleigh channel

snr_linear = 10.^(snr_db/10);
ber = 0.5 * (1 - sqrt(snr_linear./(1 + snr_linear)));
end