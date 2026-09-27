function [pos, neg, zer, ev, od] = classifyArray(arr)
% Returns counts of positive, negative, zero, even and odd values
% Even/odd check applies only to integer elements

pos = 0; neg = 0; zer = 0; ev = 0; od = 0;
for i = 1:length(arr)
    val = arr(i);
    if val > 0
        pos = pos + 1;
    elseif val < 0
        neg = neg + 1;
    else
        zer = zer + 1;
    end
    if val == fix(val)
        if mod(val, 2) == 0
            ev = ev + 1;
        else
            od = od + 1;
        end
    end
end
end
