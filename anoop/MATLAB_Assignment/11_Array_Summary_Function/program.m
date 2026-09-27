% Program 11: Multi-output Array Summary Function
% Calls arraySummary for positive, all-negative, and mixed arrays
clc; clear;

arrays = {[29 14 42 21 6], ...
          [-11 -18 -7 -25 -16], ...
          [9 -5 0 18 -8 11]};
names = {'Positive values', 'All-negative', 'Mixed array'};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Array Summary Report ===\n');

for i = 1:length(arrays)
    [tot, avg, mn, mx] = arraySummary(arrays{i});
    fprintf(fid, '\n%s: ', names{i}); fprintf(fid, '%g ', arrays{i});
    fprintf(fid, '\n  Total   = %g\n  Average = %.2f\n  Min     = %g\n  Max     = %g\n', ...
            tot, avg, mn, mx);
end
fclose(fid);

type('output.txt');
