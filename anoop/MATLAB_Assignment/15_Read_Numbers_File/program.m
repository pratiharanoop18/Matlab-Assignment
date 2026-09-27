% Program 15: Read and Analyze Numbers from File
% Reads values from input.txt, classifies and computes statistics
% Verifies that the file opened successfully
clc; clear;

fIn = fopen('input.txt', 'r');
if fIn == -1
    fOut = fopen('output.txt', 'w');
    fprintf(fOut, 'Error: input.txt could not be opened.\n');
    fclose(fOut);
    disp('Error: input.txt could not be opened.');
    return;
end
values = fscanf(fIn, '%f');
fclose(fIn);

if isempty(values)
    disp('input.txt contains no numeric data.');
    return;
end

% single-pass classification and stats
positives = []; negatives = []; zeroCount = 0;
grandTotal = 0; minVal = values(1); maxVal = values(1);
for i = 1:length(values)
    v = values(i);
    grandTotal = grandTotal + v;
    if v > 0
        positives(end+1) = v;
    elseif v < 0
        negatives(end+1) = v;
    else
        zeroCount = zeroCount + 1;
    end
    if v < minVal
        minVal = v;
    end
    if v > maxVal
        maxVal = v;
    end
end
average = grandTotal / length(values);

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Failed to create output.txt');
end
fprintf(fOut, '=== Number File Analysis ===\n');
fprintf(fOut, 'Values read    : '); fprintf(fOut, '%g ', values);
fprintf(fOut, '\nTotal count    : %d\n', length(values));
fprintf(fOut, 'Positive (%d)   : ', length(positives)); fprintf(fOut, '%g ', positives);
fprintf(fOut, '\nNegative (%d)   : ', length(negatives)); fprintf(fOut, '%g ', negatives);
fprintf(fOut, '\nZeros          : %d\n', zeroCount);
fprintf(fOut, 'Sum            : %g\n', grandTotal);
fprintf(fOut, 'Average        : %.2f\n', average);
fprintf(fOut, 'Minimum        : %g\n', minVal);
fprintf(fOut, 'Maximum        : %g\n', maxVal);
fclose(fOut);

type('output.txt');
