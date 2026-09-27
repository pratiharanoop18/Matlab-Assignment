function [tot, avg, mn, mx] = arraySummary(arr)
% Calculates total, average, min and max
% Min and max found manually with a loop instead of built-in functions

tot = 0; avg = 0; mn = NaN; mx = NaN;
if isempty(arr)
    return;
end

mn = arr(1);
mx = arr(1);
for i = 1:length(arr)
    tot = tot + arr(i);
    if arr(i) < mn
        mn = arr(i);
    end
    if arr(i) > mx
        mx = arr(i);
    end
end
avg = tot / length(arr);
end
