% Program 2: Second Largest Distinct Value
% Finds second largest without sort(), handles repeated max correctly
clc; clear;

arr = [47 83 29 83 62 47 97 97 51 62];

% locate the maximum element
maxVal = arr(1);
for i = 2:length(arr)
    if arr(i) > maxVal
        maxVal = arr(i);
    end
end

% scan for the biggest value below the maximum
foundSecond = false;
nextMax = 0;
for i = 1:length(arr)
    if arr(i) < maxVal
        if ~foundSecond || arr(i) > nextMax
            nextMax = arr(i);
            foundSecond = true;
        end
    end
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to open output.txt');
end
fprintf(fid, '=== Second Largest Distinct Value ===\n');
fprintf(fid, 'Input array    : '); fprintf(fid, '%g ', arr);
fprintf(fid, '\nMaximum        : %g\n', maxVal);
if foundSecond
    fprintf(fid, 'Second largest : %g\n', nextMax);
else
    fprintf(fid, 'No second distinct value exists (all elements identical).\n');
end
fclose(fid);

type('output.txt');
