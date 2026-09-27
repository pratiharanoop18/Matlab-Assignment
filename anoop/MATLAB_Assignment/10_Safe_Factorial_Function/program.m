% Program 10: Validated Factorial Function - driver script
% Tests safeFactorial with valid, edge-case, and invalid inputs
clc; clear;

inputs = [7 0 9 -3 4.5];

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Factorial Test Results ===\n');

for i = 1:length(inputs)
    n = inputs(i);
    [result, valid] = safeFactorial(n);
    if valid
        fprintf(fid, 'Test %d: %g! = %g\n', i, n, result);
    else
        fprintf(fid, 'Test %d: %g -> Invalid (must be a non-negative integer)\n', i, n);
    end
end
fclose(fid);

type('output.txt');
