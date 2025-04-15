function plot_signals(x_plot, y_awgn, y_rayleigh, t_plot)
% PLOT_SIGNALS Plot original, AWGN, and Rayleigh signals
%   plot_signals(x_plot, y_awgn, y_rayleigh, t_plot) plots signal samples
%
%   Parameters:
%   - x_plot: Original signal samples
%   - y_awgn: Signal after AWGN channel
%   - y_rayleigh: Signal after Rayleigh channel
%   - t_plot: Time indices for plotting

figure;

% Original signal
subplot(3,1,1);
plot(t_plot, x_plot, 'b-', 'LineWidth', 1.5);
grid on;
title('Original BPSK Signal');
xlabel('Sample Index');
ylabel('Amplitude');
ylim([-2 2]);

% AWGN signal
subplot(3,1,2);
plot(t_plot, real(y_awgn), 'r-', 'LineWidth', 1.5);
grid on;
title('AWGN Channel Signal (SNR = 10dB)');
xlabel('Sample Index');
ylabel('Amplitude');
ylim([-2 2]);

% Rayleigh fading signal
subplot(3,1,3);
plot(t_plot, real(y_rayleigh), 'g-', 'LineWidth', 1.5);
grid on;
title('Rayleigh Fading Channel Signal (SNR = 10dB)');
xlabel('Sample Index');
ylabel('Amplitude');
ylim([-2 2]);
end