%Launch Matlab, learn which data types are available (how are the variables treated in Matlab?)
%variables in  matlab are typed DYNAMICALLY and all of them are treated as MATRIX (MATRIX LABOLATORY)


%2. Create variable a and assign it the value of 1, next 2 , and π/6.
%Observe the difference in result display whether semi-colon has been used, or not

clear;
a = 1;
fprintf('a = %.10f\n', a); %Dostosowywujemy liczbe do 10 miuejsc po przecinku

a = sqrt(2);
fprintf('a = %.10f\n', a);

a = pi;
fprintf('a = %.10f\n', a);

% 3. Command history ( and ).
% 4. Removing all the variables – command clear.
% It is advisable to use the clear command in the first line of a script in order to avoid
% unwanted side-effects related to variable name reuse in different scripts.
% 5. Command clear variable_name. 
clear a;
% display(a); CAUSES AN ERROR!
a=pi/2;
rot = [cos(a), -sin(a); sin(a), cos(a)];
disp("Rotation Matrix: ");
disp(rot);

%7. Command help. Check which operators are available in Matlab. Get familiarized with the
% plot function.
% a. help +
% b. help plot
% help operator

% Write a script in which you will calculate scalar, vector, and Hadamard product of two
% vectors: [ 1 2 ] and [ 3 4 ]. 
vec1=[1, 2];
vec2=[3,4];

vecDot=dot(vec1, vec2);
fprintf('Dot product= %f\n', vecDot);


vec13D=[1,2,0];
vec23D=[3,4,0];
vecCross=cross(vec13D, vec23D);
fprintf('Cross product= [%f, %f, %f]\n', vecCross);


hadamardProduct=vec1 .* vec2;
fprintf('Hadamard product= [%f, %f]\n', hadamardProduct);

figure; %okno
hold on; %nie nadpisuje wykresu
grid on; %siatka
axis equal; %rowne osie

plot([0, vec1(1)], [0, vec1(2)], 'r', 'LineWidth', 2) %czerwona linia o grubosci wektor 1
plot([0, vec2(1)], [0, vec2(2)], 'b', 'LineWidth', 2) %niebieska linia o grubosci wektor 2

xlabel('x');
ylabel('y');
title('vec1 and vec2 vectors');
legend('vec1', 'vec2');


function plotFunctions(a_values)
    k=1;

    figure;
    %funkcja 1
    subplot(3, 1, 1);
    x1=linspace(-pi, pi, 1000);
    hold on;
    for a=a_values
        y1=k * sin(a*x1);
        plot(x1, y1, 'LineWidth', 1, 'DisplayName', sprintf('a=%d', a));
    end;
    hold off;
    grid on;
    xlabel('x');
    ylabel('y');
    title('y = k sin(ax)');
    legend show;

    %funkcja 2
    subplot(3, 1, 2);
    x2=linspace(0,2,1000);
    hold on;
    for a=a_values;
        y2=1-exp(-a*x2);
        plot(x2, y2,'LineWidth', 1, 'DisplayName', sprintf('a=%d', a));
    end;
    hold off;
    grid on;
    xlabel('x');
    ylabel('y');
    title('y = 1-e^(-ax)');
    legend show;

    %funkcja 3
    subplot(3,1,3);
    x3=linspace(-10, 10, 10000);
    hold on;
    y3 = sin(x3) ./ x3; 
    y3(x3 == 0) = 1; %  limit w 0 -> 1)
    plot(x3, y3,'LineWidth', 1);
    hold off;
    grid on;
    xlabel('x');
    ylabel('y');
    title('y = sin(x)/x');

end;

plotFunctions([1, 2, 3]);


%10.X-Y graph: plot a few circles, ellipses, and rectangles.  Automate the operations through a custom-defined function. 

function drawShapes()
    figure; hold on; axis equal;
    drawCircle(0, 0, 5);
    drawCircle(5, 5, 3);

    drawElipse(-5, -5, 6, 3);
    drawElipse(2, -3, 4, 2);

    drawRect(-4, 2, 5, 3);
    drawRect(3, -6, 4, 2);

end

function drawCircle(x, y, r)
    theta=linspace(0, 2*pi, 100);
    X=r*cos(theta) +x;
    Y =r*sin(theta) + y;
    plot(X, Y, 'b', 'LineWidth', 2);
end;

function drawElipse(x, y, rx, ry)
    theta=linspace(0, 2*pi, 1000);
    X=rx*cos(theta) + x;
    Y = ry*sin(theta) + y;
    plot(X, Y, 'r', 'LineWidth', 2);
end;

function drawRect(x, y, w, h) 
    X=[x, x+w, x+w, x, x];
    Y = [y, y, y+h, y+h, y];
    plot(X, Y, 'g', 'LineWidth', 2);
end

drawShapes();