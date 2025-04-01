% clear all;
% clc;
% a=pi/2;
% rotationMatrix=[cos(a), sin(a); -sin(a), cos(a) ];
% sprintf('%.2f %.2f %.2f %.2f', rotationMatrix)


% vec1=[1,2,0];
% vec2=[2,3,0];
% d=dot(vec1,vec2);
% c=cross(vec1,vec2);
% h= vec1 .* vec2;
% fprintf('Dot: %d \n', d);
% fprintf('Cross: %.5f %.5f %.5f \n', c(1), c(2), c(3) );
% fprintf('Hadamard: %.5f %.5f %.5f \n', h(1), h(2), h(3));

% figure
% vec12D=[1,2];
% vec22D=[3,4];
% hold on;
% plot([0, vec1(1)], [0, vec1(2)], 'g');
% plot([0, vec2(1)], [0, vec2(2)], 'r');
% hold off;
% grid on;
% xlabel("x");
% ylabel("y");
% title("vec 1 and vec 2")

% function plotFunctions(a_values, kParameter)
%     figure;
%     subplot(3, 1, 1);
%     hold on;
%     x=linspace(-pi, pi, 1000);
%     for a=a_values
%         y=kParameter*sin(a*x);
%         label=sprintf("a=%.2f", a);
%         plot(x, y, 'DisplayName', label );
%     end;

%     hold off;
%     xlabel("x");
%     ylabel("y");
%     legend show;
%     title("k*sin(-a*x)");
%     subplot(3, 1, 2);
%     hold on;
%     x=linspace(0,2);
%     for a=a_values
%         y=1-exp(-1 * a*x);
%         label = sprintf("a=%.2f", a);
%         plot(x, y, 'DisplayName', label);
%     end;
%     hold off;
%     title("1-e ^ (-a*x)");
%     xlabel("x");
%     ylabel("y");
%     legend show;

%     subplot(3, 1, 3);
%     hold on;
%     x=linspace(-10, 10, 1000);
%     y=sin(x)./x;
%     label="sin(x)/x";
%     plot(x, y, 'DisplayName', label);
%     hold off;
%     legend show;

% end



% plotFunctions([1,2,3], 1);

% function drawCircles(x, y, r)
%     theta = linspace(0, 2*pi, 1000 );
%     X=x + r*cos(theta);
%     Y=y + r*sin(theta);
%     plot(X, Y);
% end

% function drawElipse(x, y, rx, ry)
%     theta=linspace(0, 2*pi, 1000);
%     X=x + rx*cos(theta);
%     Y=y + ry*sin(theta);
%     plot(X,Y);
% end

% function drawRect(x, y, w, h)
%     X=[x, x+w, x+w, x, x];
%     Y = [y, y, y+h, y+h, y];
%     plot(X,Y);
% end

% figure
% hold on;
% drawCircles(1, 1, 2);
% drawCircles(3, 2, 4);
% drawElipse(1, 1, 3, 4);
% drawRect(1, 1, 4, 3);
% drawRect(3, 3, 5, 1);
% hold off;
% axis equal;

%. Sequences. Write a script to generate a sequence
% a. geometric (parametrized by coefficient a > 1, a = 1, a < 1),
% b. Fibonacci.
% Plot the results

% function geometric(a1, a2, a3, range)
%     figure;
%     hold on;
%     n=0:range;
%     geo_seq1=a1.^n;
%     geo_seq2=a2.^n;
%     geo_seq3=a3.^n;
%     plot(n, geo_seq1, 'DisplayName', 'a<1');
%     plot(n, geo_seq2, 'DisplayName', 'a=1');
%     plot(n, geo_seq3, 'g--','DisplayName', 'a>1');
%     grid on;
%     legend show;
%     hold off;
% end
% geometric(0.5, 1, 2, 20);

% function fibonacci()
%     fibonacciVals=zeros(15);
%     fibonacciVals(1)=0;
%     fibonacciVals(2)=1;
%     for i=3:15
%         fibonacciVals(i)=fibonacciVals(i-1)+fibonacciVals(i-2);
%     end
%     figure;
%     hold on;
%     plot(1:15, fibonacciVals, 'o');
%     title('Fibonnaci values');
%     grid on;
% end;
% fibonacci();


x=-5:0.1:5;
y=-5:0.1:5;
figure;
subplot(2,1,1)
[X,Y]=meshgrid(x,y);
Z=X.^2+2*Y.^2;
surf(X, Y, Z, 'EdgeColor', 'none');
subplot(2,1,2);
Z2=X.^2-Y.^2;
surf(X,Y,Z2, 'EdgeColor', 'none');
xlabel('x');
ylabel('y');
zlabel('z');

figure(2)
hold on;
y_values=[-1, 0, 2];
x=-5:0.1:5;
for y=y_values
    f=x.^2 + 2*y^2;
    plot(x, f, 'DisplayName', sprintf('y=%d', y));
end
hold off;
legend show;
grid on;


