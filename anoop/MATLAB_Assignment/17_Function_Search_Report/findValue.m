function [idx, cnt] = findValue(arr, target)
% Searches arr for target, returns first 1-based index and count
% Returns idx = -1 when target is absent

idx = -1;
cnt = 0;
for i = 1:length(arr)
    if arr(i) == target
        cnt = cnt + 1;
        if idx == -1
            idx = i;
        end
    end
end
end
