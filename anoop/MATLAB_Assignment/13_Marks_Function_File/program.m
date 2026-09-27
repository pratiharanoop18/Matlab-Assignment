% Program 13: Marks Analysis Function + File Output
% Calls analyzeMarks for validation and stats, writes report to result.txt
clc; clear;

marks = [76 58 -9 52 85 107 43 29 97 103 51];

[avg, highest, nPass, nFail, validMarks, invalidMarks] = analyzeMarks(marks);

fid = fopen('result.txt', 'w');
if fid == -1
    error('Failed to create result.txt');
end
fprintf(fid, '=== Marks Analysis Report ===\n');
fprintf(fid, 'All marks      : '); fprintf(fid, '%g ', marks);
fprintf(fid, '\nValid marks    : '); fprintf(fid, '%g ', validMarks);
fprintf(fid, '\nDropped        : '); fprintf(fid, '%g ', invalidMarks);
fprintf(fid, '\nValid count    : %d\n', length(validMarks));
fprintf(fid, 'Average        : %.2f\n', avg);
fprintf(fid, 'Highest mark   : %g\n', highest);
fprintf(fid, 'Passed (>=40)  : %d\n', nPass);
fprintf(fid, 'Failed         : %d\n', nFail);
fclose(fid);

type('result.txt');
