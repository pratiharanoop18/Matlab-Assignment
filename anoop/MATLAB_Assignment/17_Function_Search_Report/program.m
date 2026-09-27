% Program 17: Function-based Search + Report File
% Reads array from numbers.txt, searches using findValue, saves to output.txt
clc; clear;

fIn = fopen('numbers.txt', 'r');
if fIn == -1
    disp('Error: numbers.txt not found.');
    return;
end
arr = fscanf(fIn, '%f')';
fclose(fIn);

targets = [12 31 60];

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Failed to create output.txt');
end
fprintf(fOut, '=== Search Report ===\n');
fprintf(fOut, 'Array: '); fprintf(fOut, '%g ', arr);
fprintf(fOut, '\n\n%-8s %-12s %-8s %s\n', 'Target', 'First Pos', 'Count', 'Status');

for i = 1:length(targets)
    [idx, cnt] = findValue(arr, targets(i));
    if idx == -1
        status = 'Not found';
    else
        status = 'Found';
    end
    fprintf(fOut, '%-8g %-12d %-8d %s\n', targets(i), idx, cnt, status);
end
fclose(fOut);

type('output.txt');
