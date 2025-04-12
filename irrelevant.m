clear;
clc;
Z=x^2 + y^2;

y_values=[-3, 0, 3];
figure;
hold on;
for y=y_values
    x=linspace(-5, 5, 1000);
    Z = x.^2 + y^2;
    plot(x, Z, 'DisplayName', sprintf('y=%d', y));
end;
grid on;
legend show;
hold off;