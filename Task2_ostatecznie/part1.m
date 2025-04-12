clear;
data = readmatrix('experiment_1.csv');
t = data(:, 1);
y = data(:, 2);
figure;
plot(t, y, "-o")
grid on;
i = 2;
peaks = [];
times = [];

% Find peaks in the signal
while i < length(y)
    if y(i) > y(i-1)
        same_val_start = i;
        while i < length(y)-1 && y(i) == y(i+1)
            i = i + 1;
        end
        same_val_end = i;
        if y(same_val_end) > y(same_val_end + 1)
            peak = ceil((same_val_start + same_val_end)/2);
            peaks = [peaks, y(peak)];
            times = [times, t(peak)];
        end
    end
    i = i + 1;
end

%if there are no positive peaks - find negative peaks
if length(peaks) < 2
    i = 2;
    peaks = [];
    times = [];

    if y(1) < y(2)
        peaks = [peaks, y(1)];
        times = [times, t(1)];
    end

    while i < length(y)
        if y(i) < y(i-1)
            same_val_start = i;
            while i < length(y)-1 && y(i) == y(i+1)
                i = i + 1;
            end
            same_val_end = i;
            if y(same_val_end) < y(same_val_end + 1)
                valley = ceil((same_val_start + same_val_end)/2);
                peaks = [peaks, y(valley)];
                times = [times, t(valley)];
            end
        end
        i = i + 1;
    end

    if y(end) < y(end-1)
        peaks = [peaks, y(end)];
        times = [times, t(end)];
    end
end



disp('Peak times:');
disp(times);
disp('Peak values:');
disp(peaks);     

m = 0.791;
A_all=[];
T_all=[];
c_all=[];
k_all=[];
ang_freq_all=[];
damp_fact_all=[];
decay_fact_all=[];

for i=1:(length(peaks)-1)
    Ap = peaks(i);
    Ap1 = peaks(i+1);
    T(i) = times(i+1) - times(i);
    c(i) = - (2 * m / T(i)) * log(Ap1 / Ap);
    k(i) = ((c(i) * T(i))^2 + (4 * pi * m)^2) / (4 * m * T(i)^2);
    ang_freq(i) = sqrt(k(i)/m);
    damp_fact(i) = c(i)/(2*sqrt(k(i)*m));
    decay_fact(i) = ang_freq(i)*damp_fact(i);

    A_all(end+1) = Ap;
    A_all(end+1) = Ap1;
    T_all(end+1) = T(i);
    c_all(end+1) = c(i);
    k_all(end+1) = k(i);
    ang_freq_all(end+1) = ang_freq(i);
    damp_fact_all(end+1) = damp_fact(i);
    decay_fact_all(end+1) = decay_fact(i);

end
disp('Period T:');
disp(T);
disp('Exponential decay factor:');
disp(decay_fact);
T_avg = mean(T_all)
decay_avg = mean(decay_fact_all);
c_min = min(c_all)
c_max = max(c_all)
c_avg = mean(c_all)
k_min = min(k_all)
k_max = max(k_all)
k_avg = mean(k_all)
