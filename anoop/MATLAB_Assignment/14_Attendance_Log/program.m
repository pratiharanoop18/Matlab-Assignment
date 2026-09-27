% Program 14: Persistent Attendance Log
% Appends records to attendance.txt using 'a' mode
% Validates status: only P (Present), A (Absent), L (Leave) accepted
clc; clear;

allowedCodes = {'P', 'A', 'L'};
statusNames = {'Present', 'Absent', 'Leave'};

numRecords = input('How many records to add: ');

fid = fopen('attendance.txt', 'a');
if fid == -1
    error('Cannot open attendance.txt');
end

added = 0;
for r = 1:numRecords
    name = strtrim(input(sprintf('Record %d - Student name: ', r), 's'));
    if isempty(name)
        fprintf('Empty name, skipping record.\n');
        continue;
    end

    code = upper(strtrim(input('Status (P/A/L): ', 's')));

    % validate against allowed codes
    matched = 0;
    for j = 1:length(allowedCodes)
        if strcmp(code, allowedCodes{j})
            matched = j;
            break;
        end
    end

    if matched == 0
        fprintf('''%s'' is not valid for %s. Skipping.\n', code, name);
    else
        fprintf(fid, '%-16s | %s\n', name, statusNames{matched});
        added = added + 1;
        fprintf('Saved: %s - %s\n', name, statusNames{matched});
    end
end
fclose(fid);

fprintf('\n%d record(s) written. File contents:\n', added);
type('attendance.txt');
