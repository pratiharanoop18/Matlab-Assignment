% Program 7: Manual Matrix Maximum with Position
% Nested loops to find max and its row/col location
% Initialises from first element so all-negative matrices are handled
clc; clear;

matrices = {[12 29 -7; 21 5 34; -6 25 16], ...
            [-11 -18 -5; -7 -25 -12; -20 -30 -14]};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Manual Matrix Maximum ===\n');

for m = 1:length(matrices)
    A = matrices{m};
    peakVal = A(1, 1); peakRow = 1; peakCol = 1;
    for r = 1:size(A, 1)
        for c = 1:size(A, 2)
            if A(r, c) > peakVal
                peakVal = A(r, c);
                peakRow = r;
                peakCol = c;
            end
        end
    end

    fprintf(fid, '\nMatrix %d:\n', m);
    for r = 1:size(A, 1)
        fprintf(fid, '%6g', A(r, :)); fprintf(fid, '\n');
    end
    fprintf(fid, 'Maximum    : %g\n', peakVal);
    fprintf(fid, 'Position   : Row %d, Col %d\n', peakRow, peakCol);
end
fclose(fid);

type('output.txt');
