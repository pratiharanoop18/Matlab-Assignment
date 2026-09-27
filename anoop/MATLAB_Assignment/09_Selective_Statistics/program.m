% Program 9: Selective Processing with continue
% Skips non-positive values, computes stats on positive values only
clc; clear;

datasets = {[11 -5 0 18 -7 14 0 9 -12 6], ...
            [-6 0 -14 -5 0]};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Selective Statistics (positive only) ===\n');

for d = 1:length(datasets)
    data = datasets{d};
    numPos = 0; totalPos = 0;
    for i = 1:length(data)
        if data(i) <= 0
            continue;
        end
        numPos = numPos + 1;
        totalPos = totalPos + data(i);
    end

    fprintf(fid, '\nDataset %d: ', d); fprintf(fid, '%g ', data);
    fprintf(fid, '\nPositive count : %d\n', numPos);
    if numPos > 0
        fprintf(fid, 'Sum of positive: %g\n', totalPos);
        fprintf(fid, 'Average        : %.2f\n', totalPos / numPos);
    else
        fprintf(fid, 'No positive values exist. Cannot compute sum or average.\n');
    end
end
fclose(fid);

type('output.txt');
