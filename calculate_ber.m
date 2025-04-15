function ber = calculate_ber(original_bits, received_bits)
% CALCULATE_BER Calculate Bit Error Rate
%   ber = calculate_ber(original_bits, received_bits) returns the bit error
%   rate between original and received bits
%
%   Parameters:
%   - original_bits: Original transmitted bits
%   - received_bits: Received bits after demodulation
%
%   Returns:
%   - ber: Bit Error Rate

num_errors = sum(original_bits ~= received_bits);
total_bits = length(original_bits);
ber = num_errors / total_bits;
end