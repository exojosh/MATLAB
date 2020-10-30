function [root, history] = bisection(func, a, b, iterations)
% Bisection method that runs for <iterations> iterations.
%By: Josh Limon  | Student ID: 804-984-257
%Each iteration determine is the root variable is positive or negative and
%makes the current potential root equal to a or b respectively accordingly.
if iterations < 1 
    printf("Please input iterations >= 1");
    return;
end
if a >= b
    % I opt to switch the two inputs as practice
    temp = a;
    a = b;
    b = temp;
    return; 
end
fA = func(a);
fB = func(b);
if fA == 0 || fB == 0
    printf("Error: either f(a) = 0 or f(b) = 0; trivial root");
    return;
end
if sign(fA) == sign(fB)
    printf("ERROR: Endpoint zero: f(a) = %f, f(b) = %f\n", fA, fB);
    return;
end
%Pre-Allocate memory cuz it's optimal according to Mr. Krieger :)
history.left = zeros(1, iterations);
history.right = zeros(1, iterations);
history.mid = zeros(1, iterations);
history.fMid = zeros(1, iterations);

for iter = 1:iterations
    mid = (a + b) / 2;
    fMid = func(mid);
    history.left(iter) = a;
    history.right(iter) = b;
    history.mid(iter) = mid;
    history.fMid(iter) = fMid;
    
    if sign(fMid) == sign(fA)
        a = mid;
        fA = fMid;
    else
        b = mid;
        fB = fMid;
    end
end
root = mid;
end
   