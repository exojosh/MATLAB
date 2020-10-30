function [root, history] = modNewton(p0, f, df, d2f, abs_tol, max_iter)
%We got the modified Newton method here
%Newton is definitely my favorite mathematicians, made the most progress.
%By: Josh Limon
%p0 is initial guess. f is function.
%df is first derivative, 
%d2f is second derivative

if abs_tol < 0
    abs_tol = abs(abs_tol);
end

p_prev = p0;
history = zeros(max_iter, 2);
%midterm problem only asks for |f(pn)| and |pn - pn-1|

for it = 1:max_iter
    f_prev = f(p_prev); df_prev = df(p_prev); d2f_prev = d2f(p_prev);
    p_curr = p_prev - (f_prev*df_prev)/(df_prev^2 - f_prev*d2f_prev);
    
    absf = abs(f(p_curr));
    absError = abs(p_curr - p_prev);
    
    history(it,:) = [absf absError];
    
    if absError < abs_tol || absf < abs_tol
        history = history(1:it, :);
        break;
    end
    
    p_prev = p_curr;
end
root = p_curr;
end