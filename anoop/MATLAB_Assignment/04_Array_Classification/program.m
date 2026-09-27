% Program 4: Array Classification and Summary
% Classifies elements by sign and parity, finds dominant category
clc; clear;

arr = [17 -9 0 11 -23 4.7 0 28 -3 6 -14 21];

countPos = 0; countNeg = 0; countZero = 0;
countEven = 0; countOdd = 0; countFrac = 0;
totalPos = 0; totalNeg = 0;

for i = 1:length(arr)
    val = arr(i);
    % classify by sign
    if val > 0
        countPos = countPos + 1;
        totalPos = totalPos + val;
    elseif val < 0
        countNeg = countNeg + 1;
        totalNeg = totalNeg + val;
    else
        countZero = countZero + 1;
    end
    % even/odd only for integers
    if val == fix(val)
        if mod(val, 2) == 0
            countEven = countEven + 1;
        else
            countOdd = countOdd + 1;
        end
    else
        countFrac = countFrac + 1;
    end
end

% determine which sign category has the most elements
categories = {'Positive', 'Negative', 'Zero'};
counts = [countPos countNeg countZero];
topIdx = 1;
for i = 2:3
    if counts(i) > counts(topIdx)
        topIdx = i;
    end
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Array Classification ===\n');
fprintf(fid, 'Array          : '); fprintf(fid, '%g ', arr);
fprintf(fid, '\nPositive       : %d\n', countPos);
fprintf(fid, 'Negative       : %d\n', countNeg);
fprintf(fid, 'Zero           : %d\n', countZero);
fprintf(fid, 'Even integers  : %d\n', countEven);
fprintf(fid, 'Odd integers   : %d\n', countOdd);
fprintf(fid, 'Non-integers   : %d (not counted for even/odd)\n', countFrac);
fprintf(fid, 'Positive sum   : %g\n', totalPos);
fprintf(fid, 'Negative sum   : %g\n', totalNeg);
fprintf(fid, 'Dominant group : %s (%d values)\n', categories{topIdx}, counts(topIdx));
fclose(fid);

type('output.txt');
