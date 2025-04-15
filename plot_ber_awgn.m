function plot_ber_awgn(snr_db, ber_theory, ber_sim)
% PLOT_BER_AWGN Plot BER vs SNR for AWGN channel
%   plot_ber_awgn(snr_db, ber_theory, ber_sim) plots BER curves
%
%   Parameters:
%   - snr_db: SNR values in dB
%   - ber_theory: Theoretical BER values
%   - ber_sim: Simulated BER values

figure;
semilogy(snr_db, ber_theory, 'b-', 'LineWidth', 2); hold on;
semilogy(snr_db, ber_sim, 'r*-', 'LineWidth', 1);
grid on;
legend('Theory (AWGN)', 'Sim (AWGN)');
title('BER vs SNR for AWGN Channel');
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
ylim([1e-6 1]);
end