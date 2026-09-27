% Program 18: Matrix File Analyzer
% Reads matrix from matrix.txt, finds max/min with positions using nested loops,
% computes row sums, identifies highest-sum row
clc; clear;

fIn = fopen('matrix.txt', 'r');
if fIn == -1
    disp('Error: matrix.txt not found.');
    return;
end

% read matrix line by line to handle any size
M = [];
line = fgetl(fIn);
while ischar(line)
    row = sscanf(line, '%f')';
    if ~isempty(row)
        M(end+1, :) = row;
    end
    line = fgetl(fIn);
end
fclose(fIn);

[nRows, nCols] = size(M);

% nested loop: find max, min, and row sums
globalMax = M(1,1); gMaxR = 1; gMaxC = 1;
globalMin = M(1,1); gMinR = 1; gMinC = 1;
rowTotal = zeros(1, nRows);
for i = 1:nRows
    for j = 1:nCols
        rowTotal(i) = rowTotal(i) + M(i, j);
        if M(i, j) > globalMax
            globalMax = M(i, j); gMaxR = i; gMaxC = j;
        end
        if M(i, j) < globalMin
            globalMin = M(i, j); gMinR = i; gMinC = j;
        end
    end
end

topRow = 1;
for i = 2:nRows
    if rowTotal(i) > rowTotal(topRow)
        topRow = i;
    end
end

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Failed to create output.txt');
end
fprintf(fOut, '=== Matrix File Analysis ===\n');
fprintf(fOut, 'Matrix (%dx%d) from matrix.txt:\n', nRows, nCols);
for i = 1:nRows
    fprintf(fOut, '%6g', M(i, :)); fprintf(fOut, '\n');
end
fprintf(fOut, '\nMaximum: %g at Row %d, Col %d\n', globalMax, gMaxR, gMaxC);
fprintf(fOut, 'Minimum: %g at Row %d, Col %d\n\n', globalMin, gMinR, gMinC);
for i = 1:nRows
    fprintf(fOut, 'Row %d sum: %g\n', i, rowTotal(i));
end
fprintf(fOut, '\nHighest sum: Row %d (sum = %g)\n', topRow, rowTotal(topRow));
fclose(fOut);

type('output.txt');
