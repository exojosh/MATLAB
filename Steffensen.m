function [p2n] = Steffensen(p0, g, max_iter)
%Steffensen's Accelerated dandy Convergence
%Code by: Josh Limon
%all the variables are what you'd expect
%p0 is initial point, max_iter is max # of iterations
%g is the function input, so just input g = @(x) 3.^(-x)
%to code with
format long
p_curr = p0;
p_prev1 = g(p_curr);
p_prev2 = g(p_prev1);
    
p2ntemp = zeros(1, max_iter + 1);
p2n = zeros(1, max_iter);

for it = 1:(max_iter + 1)
    
    p_curr = p_curr - ((p_prev1 - p_curr)^2)/(p_prev2 - 2*p_prev1 + p_curr);
    p_prev1 = g(p_curr);
    p_prev2 = g(p_prev1);
    
    p2ntemp(it) = p_prev2;

end
for it = 1:max_iter
    p2n(it) = abs(p2ntemp(it + 1) - p2ntemp(it));
end
end