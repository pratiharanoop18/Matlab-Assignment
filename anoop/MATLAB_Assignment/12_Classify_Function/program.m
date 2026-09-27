% Program 12: Reusable Array Classification Function
% Compares classification results for two different arrays
clc; clear;

setA = [11 -18 0 23 -7 14 31 0];
setB = [-24 12 -6 0 13 -27 19 4.3];

[pA, nA, zA, eA, oA] = classifyArray(setA);
[pB, nB, zB, eB, oB] = classifyArray(setB);

headings = {'Positive', 'Negative', 'Zero', 'Even', 'Odd'};
countA = [pA nA zA eA oA];
countB = [pB nB zB eB oB];

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Classification Comparison ===\n');
fprintf(fid, 'Set A: '); fprintf(fid, '%g ', setA);
fprintf(fid, '\nSet B: '); fprintf(fid, '%g ', setB);
fprintf(fid, '\n\n%-10s %7s %7s   %s\n', 'Category', 'Set A', 'Set B', 'Note');
fprintf(fid, '%s\n', repmat('=', 1, 42));
for i = 1:length(headings)
    if countA(i) > countB(i)
        note = 'A higher';
    elseif countA(i) < countB(i)
        note = 'B higher';
    else
        note = 'Equal';
    end
    fprintf(fid, '%-10s %7d %7d   %s\n', headings{i}, countA(i), countB(i), note);
end
fclose(fid);

type('output.txt');
