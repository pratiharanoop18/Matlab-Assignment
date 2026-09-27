% Program 1: Student Result Analyzer
% Validates marks (0-100), computes statistics, classifies pass/fail
clc; clear;

marks = [78 42 -5 89 53 112 67 29 96 -11 45 83];
cutoff = 40;

% separate valid and invalid entries
goodMarks = [];
badMarks = [];
for i = 1:length(marks)
    if marks(i) >= 0 && marks(i) <= 100
        goodMarks(end+1) = marks(i);
    else
        badMarks(end+1) = marks(i);
    end
end

markSum = 0; maxMark = 0; minMark = 0;
passNum = 0; failNum = 0;

if ~isempty(goodMarks)
    maxMark = goodMarks(1);
    minMark = goodMarks(1);
    for i = 1:length(goodMarks)
        markSum = markSum + goodMarks(i);
        if goodMarks(i) > maxMark
            maxMark = goodMarks(i);
        end
        if goodMarks(i) < minMark
            minMark = goodMarks(i);
        end
        if goodMarks(i) >= cutoff
            passNum = passNum + 1;
        else
            failNum = failNum + 1;
        end
    end
    meanMark = markSum / length(goodMarks);
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to open output.txt');
end
fprintf(fid, '=== Student Result Analyzer ===\n');
fprintf(fid, 'Input marks    : '); fprintf(fid, '%g ', marks);
fprintf(fid, '\nValid marks    : '); fprintf(fid, '%g ', goodMarks);
fprintf(fid, '\nRejected marks : '); fprintf(fid, '%g ', badMarks);
fprintf(fid, '\nPass threshold : >= %d\n', cutoff);
if isempty(goodMarks)
    fprintf(fid, 'No valid marks to process.\n');
else
    fprintf(fid, 'Total          : %g\n', markSum);
    fprintf(fid, 'Average        : %.2f\n', meanMark);
    fprintf(fid, 'Highest        : %g\n', maxMark);
    fprintf(fid, 'Lowest         : %g\n', minMark);
    fprintf(fid, 'Passed         : %d\n', passNum);
    fprintf(fid, 'Failed         : %d\n', failNum);
end
fclose(fid);

type('output.txt');
