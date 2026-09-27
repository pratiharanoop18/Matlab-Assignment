function [avg, highest, nPass, nFail, validMarks, invalidMarks] = analyzeMarks(marks)
% Filters marks to 0-100 range, computes average and highest,
% counts pass (>=40) and fail among valid marks

passLine = 40;
validMarks = [];
invalidMarks = [];
for i = 1:length(marks)
    if marks(i) >= 0 && marks(i) <= 100
        validMarks(end+1) = marks(i);
    else
        invalidMarks(end+1) = marks(i);
    end
end

avg = 0; highest = 0; nPass = 0; nFail = 0;
if isempty(validMarks)
    return;
end

total = 0;
highest = validMarks(1);
for i = 1:length(validMarks)
    total = total + validMarks(i);
    if validMarks(i) > highest
        highest = validMarks(i);
    end
    if validMarks(i) >= passLine
        nPass = nPass + 1;
    else
        nFail = nFail + 1;
    end
end
avg = total / length(validMarks);
end
