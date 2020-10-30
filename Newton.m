function [root, history] = Newton(p0, f, df, abs_tol, max_iter)
%Josh Limon Newton function for midterm,
%max_iter is maximum number of iterations
%max_tol is error tolerance
%p0 is initial guess
%rest is by label.
%root is root lol/
if abs_tol < 0
    abs_tol = abs(abs_tol);
end

p_prev = p0;
history = zeros(max_iter, 2); 
%midterm problem only asks for |f(pn)| and |pn - pn-1|

for it = 1:max_iter
    p_curr = p_prev - f(p_prev)/df(p_prev);
    f_curr = f(p_curr);
    df_curr = df(p_curr);
    absError = abs(p_curr - p_prev);
    history(it, :) = [abs(f_curr) absError];
    if absError < abs_tol || abs(f_curr) < abs_tol
        history = history(1:it,:);
        break;
    end
    p_prev = p_curr;
    it = it + 1;
end
root = p_curr;
end
