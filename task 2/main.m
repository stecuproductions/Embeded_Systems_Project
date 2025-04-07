clear all;
clc;
function displayResults(values)
    fprintf('--- Analysis Results ---\n\n');

    fprintf('Damped Oscillation Period T:\n');
    fprintf('  Nominal: %.4f s\n', values(1));
    fprintf('  Range:   %.4f – %.4f s\n\n', values(2), values(3));

    fprintf('Exponential Decay Factor ζω₀:\n');
    fprintf('  Nominal: %.4f 1/s\n', values(4));
    fprintf('  Range:   %.4f – %.4f 1/s\n\n', values(5), values(6));

    fprintf('Damping Coefficient c:\n');
    fprintf('  Nominal: %.4f Ns/m\n', values(7));
    fprintf('  Range:   %.4f – %.4f Ns/m\n\n', values(8), values(9));

    fprintf('Spring Constant k:\n');
    fprintf('  Nominal: %.4f N/m\n', values(10));
    fprintf('  Range:   %.4f – %.4f N/m\n', values(11), values(12));
end

%function to read a CSV file and get the data
function [x, y] = readCsv(fileName)
    lines = readlines(fileName);
    lines = lines(strlength(lines) > 0); % Remove empty lines
    n = length(lines); % Number of lines
    x = zeros(n, 1);
    y = zeros(n, 1);
    for i = 1:n
        line = replace(lines(i), ',', '.'); % Replace comma with dot
        parts = split(line, ';'); % Split by semicolon
        x(i) = str2double(parts(1)); 
        y(i) = str2double(parts(2)); 
    end
    y=y/1000; 

end
%function to read multiple CSV files and save them to data
function results = readMultipleCsv(fileList)
    numFiles= length(fileList);
    results=cell(numFiles, 1); %Array of arrays with dimension 1 x numFiles
    for i=1:numFiles
        [x,y]=readCsv(fileList{i});
        results{i}=[x,y]; % Save the data in the cell array
    end
end






function values = calculateDataValues(data)
    m = 0.791; 
    [peaks, peakTimes] = findpeaks(data(:,2), data(:,1));
    if length(peaks) < 2
        warning('Not enough peaks found in the data.');
        values = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        return;
    end
    %amplitude ratios
    amplitude_ratios = abs(peaks(1:end-1)) ./ abs(peaks(2:end));
    % Peroid
    T_all=diff(peakTimes); %All the periods T_n-1 - T_n .... 
    T_nom = mean(T_all);  %average period

    %log(A1/A2)
    log_dec = log(amplitude_ratios);          
    log_dec_nom = mean(log_dec);             
    %Damping all, damping nominal, damping extreme
    c_all = 2 * m * log_dec ./ T_all;  
    c_nom = mean(c_all);
    c_extreme = [min(c_all), max(c_all)];

    %zeta_omega0
    zeta_omega0_all = log_dec ./ T_all;
    zeta_omega0 = mean(zeta_omega0_all);

    %k
    k_all = ((c_all .* T_all).^2 + (4 * pi * m)^2) ./ (4 * m * T_all.^2);
    k_nom = mean(k_all);
    k_extreme = [min(k_all), max(k_all)];


    
    values = [T_nom, min(T_all), max(T_all), ...
        zeta_omega0, min(zeta_omega0_all), max(zeta_omega0_all), ...
        c_nom, c_extreme(1), c_extreme(2), ...
        k_nom, k_extreme(1), k_extreme(2)];
end




fileList={'experiment_1.csv', 'experiment_2.csv', 'experiment_3.csv'};
fileContents = readMultipleCsv(fileList);
calculationResults1=calculateDataValues(fileContents{1});
calculationResults2=calculateDataValues(fileContents{2});
calculationResults3=calculateDataValues(fileContents{3});
displayResults(calculationResults1);
displayResults(calculationResults2);
displayResults(calculationResults3);