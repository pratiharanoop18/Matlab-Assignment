function [result, valid] = safeFactorial(n)
% Computes n! using a loop for non-negative integers
% Returns valid=false and result=NaN for bad input

result = NaN;
valid = false;

if ~isscalar(n) || n < 0 || n ~= fix(n)
    return;
end

valid = true;
result = 1;
for i = 2:n
    result = result * i;
end
end
