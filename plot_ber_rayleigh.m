function plot_ber_rayleigh(snr_db, ber_theory, ber_sim)
% PLOT_BER_RAYLEIGH Plot BER vs SNR for Rayleigh channel
%   plot_ber_rayleigh(snr_db, ber_theory, ber_sim) plots BER curves
%
%   Parameters:
%   - snr_db: SNR values in dB
%   - ber_theory: Theoretical BER values
%   - ber_sim: Simulated BER values

figure;
semilogy(snr_db, ber_theory, 'g-', 'LineWidth', 2); hold on;
semilogy(snr_db, ber_sim, 'k*-', 'LineWidth', 1);
grid on;
legend('Theory (Rayleigh)', 'Sim (Rayleigh)');
title('BER vs SNR for Rayleigh Fading Channel');
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
ylim([1e-6 1]);
end