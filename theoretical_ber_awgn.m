function ber = theoretical_ber_awgn(snr_db, modulation)
% THEORETICAL_BER_AWGN Calculate theoretical BER for AWGN channel
%   ber = theoretical_ber_awgn(snr_db, modulation) returns theoretical BER
%   for different modulation schemes in AWGN channel
%
%   Parameters:
%   - snr_db: Signal-to-Noise Ratio in dB
%   - modulation: Modulation scheme ('BPSK', 'QPSK', 'QAM16', 'QAM64', '16PSK')
%
%   Returns:
%   - ber: Theoretical Bit Error Rate

snr_linear = 10.^(snr_db/10);

switch modulation
    case 'BPSK'
        ber = 0.5 * erfc(sqrt(snr_linear));
        
    case 'QPSK'
        ber = 0.5 * erfc(sqrt(snr_linear));
        
    case 'QAM16'
        ber = 3/8 * erfc(sqrt(0.1 * snr_linear)) .* ...
              (1 - 1/4 * erfc(sqrt(0.1 * snr_linear)));
        
    case 'QAM64'
        ber = 7/24 * erfc(sqrt(snr_linear/42)) .* ...
              (1 - 1/8 * erfc(sqrt(snr_linear/42)));

    case '16PSK'
        ber = 0.5 * erfc(sqrt(2 * snr_linear / 15)) .* ...
              (1 - 1/4 * erfc(sqrt(2 * snr_linear / 15)));
        
    otherwise
        error('Unsupported modulation scheme');
end
