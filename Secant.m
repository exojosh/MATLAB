function [root, history] = Secant(p0, p1, f, abs_tol, max_iter)
%Secant function by Josh Limon, finds root, puts it in root.
%p0, p1, initial values, f is function
%abs_tol is max allowed error.
%max_iter is self-explanatory - max amt of iterations

if abs_tol < 0
    abs_tol = abs(abs_tol);
end

p_prev2 = p0; % p_prev2 = p_prev_prev = pN-2
p_prev1 = p1; % p_prev = p_prev = pN-1
history = zeros(max_iter, 2);
for it = 1:max_iter
    f_prev2 = f(p_prev2); f_prev1 = f(p_prev1);
    p_curr = p_prev1 - (f_prev1*(p_prev1 - p_prev2))/(f(p_prev1) - f(p_prev2));
    
    absError = abs(p_curr - p_prev1);
    
    absf_curr = abs(f(p_curr));
    history(it, :) = [absf_curr absError];
    
    if absError < abs_tol || absf_curr < abs_tol
        history = history(1:it, :);
        break;
    end
    
    p_prev2 = p_prev1;
    p_prev1 = p_curr;
end
root = p_curr;
end