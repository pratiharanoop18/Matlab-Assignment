% Program 8: Validated Manual Matrix Multiplication
% Checks dimensional compatibility, multiplies using nested loops,
% compares with MATLAB's built-in A*B
clc; clear;

% case 1: valid (2x3 * 3x2), case 2: invalid (2x3 * 2x2)
matA = {[5 -4 7; 3 6 -3], [5 -4 7; 3 6 -3]};
matB = {[4 9; -3 6; 5 2], [4 5; 6 7]};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Failed to create output.txt');
end
fprintf(fid, '=== Matrix Multiplication ===\n');

for p = 1:length(matA)
    A = matA{p}; B = matB{p};
    [rA, cA] = size(A);
    [rB, cB] = size(B);
    fprintf(fid, '\nCase %d: A(%dx%d) x B(%dx%d)\n', p, rA, cA, rB, cB);

    if cA ~= rB
        fprintf(fid, 'Incompatible: A columns (%d) != B rows (%d).\n', cA, rB);
        continue;
    end

    C = zeros(rA, cB);
    for i = 1:rA
        for j = 1:cB
            for n = 1:cA
                C(i, j) = C(i, j) + A(i, n) * B(n, j);
            end
        end
    end

    matlabResult = A * B;
    fprintf(fid, 'Product (%dx%d):\n', rA, cB);
    for i = 1:rA
        fprintf(fid, '%6g', C(i, :)); fprintf(fid, '\n');
    end
    if isequal(C, matlabResult)
        fprintf(fid, 'Matches MATLAB A*B: YES\n');
    else
        fprintf(fid, 'Matches MATLAB A*B: NO\n');
    end
end
fclose(fid);

type('output.txt');
