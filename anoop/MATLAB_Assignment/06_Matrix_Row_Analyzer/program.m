% Program 6: Row-wise Matrix Analyzer
% Computes row sum, average and max using loops, finds highest-sum row
clc; clear;

M = [ 8 13 19  6;
     11 16  5  9;
     18  7 14 12;
      4 15 10 17];

[rows, cols] = size(M);
sumByRow = zeros(1, rows);
avgByRow = zeros(1, rows);
maxByRow = zeros(1, rows);

for r = 1:rows
    total = 0;
    biggest = M(r, 1);
    for c = 1:cols
        total = total + M(r, c);
        if M(r, c) > biggest
            biggest = M(r, c);
        end
    end
    sumByRow(r) = total;
    avgByRow(r) = total / cols;
    maxByRow(r) = biggest;
end

% identify row with greatest sum
topRow = 1;
for r = 2:rows
    if sumByRow(r) > sumByRow(topRow)
        topRow = r;
    end
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Row-wise Matrix Analysis ===\nMatrix:\n');
for r = 1:rows
    fprintf(fid, '%6g', M(r, :)); fprintf(fid, '\n');
end
fprintf(fid, '\n%-5s %8s %9s %7s\n', 'Row', 'Sum', 'Average', 'Max');
for r = 1:rows
    fprintf(fid, '%-5d %8g %9.2f %7g\n', r, sumByRow(r), avgByRow(r), maxByRow(r));
end
fprintf(fid, '\nRow with highest sum: Row %d (sum = %g)\n', topRow, sumByRow(topRow));
fclose(fid);

type('output.txt');
