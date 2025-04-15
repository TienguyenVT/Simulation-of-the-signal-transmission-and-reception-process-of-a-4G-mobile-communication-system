function [ber_sim_awgn, ber_sim_rayleigh] = run_ber_simulation(snr_db, num_samples, modulation)
% RUN_BER_SIMULATION Run BER simulation for both AWGN and Rayleigh channels
%   [ber_sim_awgn, ber_sim_rayleigh] = run_ber_simulation(snr_db, 
%   num_samples, modulation) runs BER simulation
%
%   Parameters:
%   - snr_db: SNR values in dB to simulate
%   - num_samples: Number of bits to simulate
%   - modulation: Modulation scheme (currently supporting 'BPSK')
%
%   Returns:
%   - ber_sim_awgn: Simulated BER for AWGN channel
%   - ber_sim_rayleigh: Simulated BER for Rayleigh channel

if nargin < 3
    modulation = 'BPSK'; % Default modulation
end

% Generate signal
[x, x_bits] = signal_generation(num_samples);
total_bits = length(x_bits);

ber_sim_awgn = zeros(size(snr_db));
ber_sim_rayleigh = zeros(size(snr_db));

% Theoretical BER calculations
ber_theory_awgn = theoretical_ber_awgn(snr_db, modulation);
ber_theory_rayleigh = theoretical_ber_rayleigh(snr_db);

% For visualization
plot_samples = 50;
t_plot = 1:plot_samples;
x_plot = x(1:plot_samples);

% Example signals for plotting
y_example_awgn = apply_awgn_channel(x_plot, 10);
[y_example_rayleigh, h_plot] = apply_rayleigh_channel(x_plot, 10);

% Plot signal examples
plot_signals(x_plot, y_example_awgn, y_example_rayleigh, t_plot);

% Run simulations for different SNR values
for i = 1:length(snr_db)
    % AWGN Channel
    y_awgn = apply_awgn_channel(x, snr_db(i));
    y_bits_awgn = bpsk_demodulate_awgn(y_awgn);
    ber_sim_awgn(i) = calculate_ber(x_bits, y_bits_awgn);
    
    % Rayleigh Fading Channel
    [y_rayleigh, h] = apply_rayleigh_channel(x, snr_db(i));
    y_bits_rayleigh = bpsk_demodulate_rayleigh(y_rayleigh, h);
    ber_sim_rayleigh(i) = calculate_ber(x_bits, y_bits_rayleigh);
    
    % Display progress
    fprintf('SNR = %d dB:\n', snr_db(i));
    fprintf('AWGN: BER = %.6f\n', ber_sim_awgn(i));
    fprintf('Rayleigh: BER = %.6f\n\n', ber_sim_rayleigh(i));
end

% Plot BER results
plot_ber_awgn(snr_db, ber_theory_awgn, ber_sim_awgn);
plot_ber_rayleigh(snr_db, ber_theory_rayleigh, ber_sim_rayleigh);

% Display final results
fprintf('\nSimulation Complete:\n');
fprintf('Minimum BER (AWGN): %.6f\n', min(ber_sim_awgn));
fprintf('Minimum BER (Rayleigh): %.6f\n', min(ber_sim_rayleigh));
end