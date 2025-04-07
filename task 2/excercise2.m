%MODEL parameters
m=0.791;
c=8.3872;
k = 355.5994;

A= [0 1; -k/m -c/m];
x0=[0.07; 0.12];
tspan = [ 0 5];
[t, x] = ode45(@(t,x) A*x, tspan, x0); %

displacement = x(:,1);                       % x1(t)
velocity = x(:,2);                           % x2(t)
acceleration = (-c/m) * x(:,2) + (-k/m) * x(:,1);   % 

% WYKRESY
figure;

subplot(3,1,1);
plot(t, displacement, 'b');
title('Przemieszczenie (y)');
xlabel('Czas [s]');
ylabel('y [m]');
grid on;

subplot(3,1,2);
plot(t, velocity, 'r');
title('Prędkość (\dot{y})');
xlabel('Czas [s]');
ylabel('v [m/s]');
grid on;

subplot(3,1,3);
plot(t, acceleration, 'g');
title('Przyspieszenie (\ddot{y})');
xlabel('Czas [s]');
ylabel('a [m/s^2]');
grid on;
