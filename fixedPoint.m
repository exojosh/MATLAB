function [root, history] = fixedPoint(g, p0, max_iterations, abs_tol)
% Fixed Point Iteration method that runs for a max of <max_iterations>
% iterations. Or until error of result is bounded by <abs_tol>. 
%By: Josh Limon  | Student ID: 804-984-257
p_curr = p0;
%No gurantee that abs_tol is positive, which it must be in some cases for
%function to stop before <max_iterations>.
if abs_tol < 0
    abs_tol = abs(abs_tol);
end
history = zeros(1, max_iterations);
for it = 1:max_iterations
    %Actual iterative step, rest is just making sure we have desired
    %accuracy.
    p_next = g(p_curr);
    %We assume that the abs(error) gets smaller with each iteration, and
    %since fixed point iteration is a special case where step_length(n+1) =
    %func_error(n), we just use step_length since, by this assumption,
    % abs(step_length(n)) > abs(func_error(n)) and therefore save
    % computations. Note because of above argument I'm pretty sure this
    % accounts for both abs(g(pn) - pn) and abs(pn - pn-1) like the
    % homework requires, just thought I'd try and optimize a bit. Also, in
    % practice, this produces more accurate results.
    
    %IGNORE ABOVE STUFF
    %I use func_error, the above stuff is just for future reference.
    step_length = abs(p_next - p_curr);
    func_error = abs(p_curr - g(p_curr));
    if func_error < abs_tol
        break;
    end
    history(it) = g(p_curr);
    p_curr = p_next;
end

%Delete unused but allocated columns from history
history(it + 1:end) = [];
root = p_curr;
end