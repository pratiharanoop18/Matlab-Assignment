% Program 19: Mini Transaction Summary
% Reads amounts from transactions.txt
% Positive = credit, negative = debit, zero = no change
clc; clear;

fIn = fopen('transactions.txt', 'r');
if fIn == -1
    disp('Error: transactions.txt not found.');
    return;
end
amounts = fscanf(fIn, '%f');
fclose(fIn);

totalCredits = 0; totalDebits = 0;
creditNum = 0; debitNum = 0; zeroNum = 0;
biggestCredit = 0; biggestDebit = 0;

for i = 1:length(amounts)
    amt = amounts(i);
    if amt > 0
        totalCredits = totalCredits + amt;
        creditNum = creditNum + 1;
        if amt > biggestCredit
            biggestCredit = amt;
        end
    elseif amt < 0
        totalDebits = totalDebits + abs(amt);
        debitNum = debitNum + 1;
        if abs(amt) > biggestDebit
            biggestDebit = abs(amt);
        end
    else
        zeroNum = zeroNum + 1;
    end
end
netBalance = totalCredits - totalDebits;

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Failed to create output.txt');
end
fprintf(fOut, '=== Transaction Summary ===\n');
fprintf(fOut, 'Total entries      : %d\n', length(amounts));
fprintf(fOut, '%s\n', repmat('=', 1, 38));
fprintf(fOut, 'No.  Amount        Type\n');
for i = 1:length(amounts)
    if amounts(i) > 0
        label = 'Credit';
    elseif amounts(i) < 0
        label = 'Debit';
    else
        label = 'No change';
    end
    fprintf(fOut, '%-4d %10.2f    %s\n', i, amounts(i), label);
end
fprintf(fOut, '%s\n', repmat('=', 1, 38));
fprintf(fOut, 'Total credits      : %.2f\n', totalCredits);
fprintf(fOut, 'Total debits       : %.2f\n', totalDebits);
fprintf(fOut, 'Net balance        : %.2f\n', netBalance);
fprintf(fOut, 'Credit count       : %d\n', creditNum);
fprintf(fOut, 'Debit count        : %d\n', debitNum);
fprintf(fOut, 'No-change entries  : %d\n', zeroNum);
fprintf(fOut, 'Largest credit     : %.2f\n', biggestCredit);
fprintf(fOut, 'Largest debit      : %.2f\n', biggestDebit);
fclose(fOut);

type('output.txt');
