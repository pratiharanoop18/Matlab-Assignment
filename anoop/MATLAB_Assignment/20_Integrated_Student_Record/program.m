% Program 20: Integrated Student Record Processor (Capstone)
% Reads marks from student_marks.txt, validates, calls resultSummary,
% writes full report to final_report.txt
clc; clear;

inputFile = 'student_marks.txt';
reportFile = 'final_report.txt';
cutoff = 40;

% safely open input file
fIn = fopen(inputFile, 'r');
if fIn == -1
    fOut = fopen(reportFile, 'w');
    if fOut ~= -1
        fprintf(fOut, 'Error: could not open %s. Report not generated.\n', inputFile);
        fclose(fOut);
    end
    fprintf('Error: could not open %s.\n', inputFile);
    return;
end
marks = fscanf(fIn, '%f');
fclose(fIn);

% call the analysis function
report = resultSummary(marks, cutoff);

% write full report
fOut = fopen(reportFile, 'w');
if fOut == -1
    error('Failed to create %s', reportFile);
end
fprintf(fOut, '==========================================\n');
fprintf(fOut, '       STUDENT RECORD FINAL REPORT\n');
fprintf(fOut, '==========================================\n');
fprintf(fOut, 'Source         : %s\n', inputFile);
fprintf(fOut, 'Marks loaded   : %d\n', length(marks));
fprintf(fOut, 'Valid (%d)      : ', length(report.valid)); fprintf(fOut, '%g ', report.valid);
fprintf(fOut, '\nInvalid (%d)    : ', length(report.invalid)); fprintf(fOut, '%g ', report.invalid);
fprintf(fOut, '\n(Valid range: 0-100; invalid values excluded)\n\n');

fprintf(fOut, 'Individual breakdown:\n');
for i = 1:length(report.valid)
    if report.valid(i) >= cutoff
        tag = 'Pass';
    else
        tag = 'Fail';
    end
    fprintf(fOut, '  Student %2d : %5g  %s\n', i, report.valid(i), tag);
end

fprintf(fOut, '\n============ Summary ============\n');
fprintf(fOut, 'Total         : %g\n', report.total);
fprintf(fOut, 'Average       : %.2f\n', report.average);
fprintf(fOut, 'Highest       : %g\n', report.highest);
fprintf(fOut, 'Lowest        : %g\n', report.lowest);
fprintf(fOut, 'Passed        : %d (cutoff %d)\n', report.passCount, cutoff);
fprintf(fOut, 'Failed        : %d\n', report.failCount);
fprintf(fOut, 'Pass %%        : %.2f%%\n', report.passPercent);
fprintf(fOut, 'Overall       : %s\n', report.overall);
fclose(fOut);

type(reportFile);
