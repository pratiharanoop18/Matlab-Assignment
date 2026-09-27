% Program 5: Search with First Position and Occurrence Count
% Uses loop with break for first match, counts all occurrences
% MATLAB arrays are 1-indexed
clc; clear;

arr = [18 7 33 12 33 25 33 6 7];
targets = [33 48];

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Search Report ===\n');
fprintf(fid, 'Array: '); fprintf(fid, '%g ', arr); fprintf(fid, '\n');

for t = 1:length(targets)
    lookFor = targets(t);

    % find first position using break
    foundAt = -1;
    for i = 1:length(arr)
        if arr(i) == lookFor
            foundAt = i;
            break;
        end
    end

    % count total occurrences across entire array
    totalHits = 0;
    for i = 1:length(arr)
        if arr(i) == lookFor
            totalHits = totalHits + 1;
        end
    end

    fprintf(fid, '\nTarget value  : %g\n', lookFor);
    if foundAt == -1
        fprintf(fid, 'Result        : %g is not present in the array.\n', lookFor);
    else
        fprintf(fid, 'First found at: position %d\n', foundAt);
        fprintf(fid, 'Total count   : %d\n', totalHits);
    end
end
fclose(fid);

type('output.txt');
