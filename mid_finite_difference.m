function u = mid_finite_difference(N, x1, x2)
f = @(x) 2.*sin(2.*pi.*(2.*x - 1)) - 20.*x.*(x - 1);
trusol = @(x) 32.*(pi.^2)*sin(2.*pi.*(2.*x - 1)) + 40;

%Function that returns mid differences approximation from x1 to x2 with N
%nodes for the poisson equation
%Code by Josh Limon with reference to TA's code

A = diag(2*ones(1, N)) - diag(ones(1, N-1), 1) - diag(ones(1, N-1), -1);
h = (x2 - x1)/N;
x = linspace(x1, x2, N);
u = A \ (h^2 * f(x)');

hold on;
plot(x, u);
accuratex = linspace(x1, x2, 1000);
accuratey = trusol(accuratex);
plot(accuratex, accuratey);
title('Discretized solution of -d^2u/dx^2 = 32*(pi^2)*sin(2*pi*(2*x - 1)) + 40')
legend('Discretized', 'Actual Solution');
end