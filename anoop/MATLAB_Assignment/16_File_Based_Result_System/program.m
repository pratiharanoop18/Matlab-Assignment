% Program 16: File-based Student Result System
%
% FORMAT of marks.txt:
%   Each line: RollNo Sub1 Sub2 Sub3 Sub4 (space separated)
%   All subjects scored out of 100
%
% Pass condition: every subject >= 40
clc; clear;

numSubjects = 4;
passMark = 40;

fIn = fopen('marks.txt', 'r');
if fIn == -1
    disp('Error: marks.txt not found.');
    return;
end
data = fscanf(fIn, '%f', [numSubjects + 1, Inf])';
fclose(fIn);

fOut = fopen('result.txt', 'w');
if fOut == -1
    error('Failed to create result.txt');
end
fprintf(fOut, '=== Student Result Report ===\n');
fprintf(fOut, 'Pass rule: every subject must be >= %d\n\n', passMark);
fprintf(fOut, '%-6s %5s %5s %5s %5s %7s %8s  %s\n', 'Roll', 'S1', 'S2', 'S3', 'S4', 'Total', 'Avg', 'Status');
fprintf(fOut, '%s\n', repmat('=', 1, 56));

passedCount = 0; failedCount = 0;
for i = 1:size(data, 1)
    roll = data(i, 1);
    subTotal = 0;
    failed = false;
    for j = 2:numSubjects + 1
        subTotal = subTotal + data(i, j);
        if data(i, j) < passMark
            failed = true;
        end
    end
    avg = subTotal / numSubjects;

    if failed
        status = 'Fail';
        failedCount = failedCount + 1;
    else
        status = 'Pass';
        passedCount = passedCount + 1;
    end
    fprintf(fOut, '%-6d %5g %5g %5g %5g %7g %8.2f  %s\n', roll, data(i, 2:end), subTotal, avg, status);
end

fprintf(fOut, '\nStudents: %d   Passed: %d   Failed: %d\n', size(data, 1), passedCount, failedCount);
fclose(fOut);

type('result.txt');
