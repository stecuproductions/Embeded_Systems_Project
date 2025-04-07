clear;
data = readmatrix('experiment_1.csv');
t = data(:, 1);
y = data(:, 2);

i = 2;
peaks = [];
times = [];
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

disp('Peak times:');
disp(times);
disp('Peak values:');
disp(peaks);     

m = 0.791;
for i=1:(length(peaks)-1)
    Ap = peaks(i);
    Ap1 = peaks(i+1);
    T(i) = times(i+1) - times(i);
    c(i) = - (2 * m / T(i)) * log(Ap1 / Ap);
    k(i) = ((c(i) * T(i))^2 + (4 * pi * m)^2) / (4 * m * T(i)^2);
    ang_freq(i) = sqrt(k(i)/m);
    damp_fact(i) = c(i)/(2*sqrt(k(i)*m));
    decay_fact(i) = ang_freq(i)*damp_fact(i);
end
disp('Period T:');
disp(T);
disp('Exponential decay factor:');
disp(decay_fact);
T_avg = mean(T)
decay_avg = mean(decay_fact);
c_min = min(c)
c_max = max(c)
c_avg = mean(c)
k_min = min(k)
k_max = max(k)
k_avg = mean(k)