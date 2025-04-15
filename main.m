% Main script to run BER simulations for different channel models
%
% This script initializes simulation parameters and runs the BER simulation
% for both AWGN and Rayleigh fading channels

% Clear workspace and figures
clear all;
close all;
clc;

% Simulation parameters
num_samples = 1e6;  % Number of bits to simulate
snr_db = 0:1:20;    % SNR range in dB
modulation = 'BPSK'; % Modulation scheme

% Run simulation
fprintf('Starting BER simulation with %d samples...\n', num_samples);
fprintf('Modulation scheme: %s\n\n', modulation);

% Run the BER simulation
[ber_sim_awgn, ber_sim_rayleigh] = run_ber_simulation(snr_db, num_samples, modulation);

% Save results
save('simulation_results.mat', 'snr_db', 'ber_sim_awgn', 'ber_sim_rayleigh');
fprintf('Results saved to simulation_results.mat\n');