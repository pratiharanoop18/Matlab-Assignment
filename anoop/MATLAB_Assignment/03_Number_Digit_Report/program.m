% Program 3: Number Digit Analysis
% Uses while loop to extract digits via mod/floor
% Checks palindrome without string conversion
clc; clear;

num = 83924;

if num <= 0 || num ~= fix(num)
    error('Input must be a positive integer.');
end

original = num;
numDigits = 0; totalDigits = 0;
countEven = 0; countOdd = 0;
reversed = 0;

while num > 0
    digit = mod(num, 10);
    numDigits = numDigits + 1;
    totalDigits = totalDigits + digit;
    if mod(digit, 2) == 0
        countEven = countEven + 1;
    else
        countOdd = countOdd + 1;
    end
    reversed = reversed * 10 + digit;
    num = floor(num / 10);
end

if reversed == original
    isPalin = 'Yes';
else
    isPalin = 'No';
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Digit Analysis ===\n');
fprintf(fid, 'Number         : %d\n', original);
fprintf(fid, 'Digit count    : %d\n', numDigits);
fprintf(fid, 'Sum of digits  : %d\n', totalDigits);
fprintf(fid, 'Even digits    : %d\n', countEven);
fprintf(fid, 'Odd digits     : %d\n', countOdd);
fprintf(fid, 'Reversed       : %d\n', reversed);
fprintf(fid, 'Palindrome     : %s\n', isPalin);
fclose(fid);

type('output.txt');
