function [pnfinal, pnhatfinal] = Aitken(p0, g,  max_iter)
%Aitkens dope convergence method
%Code by: Josh Limon
%p0 is initial point, max_iter is max # of iterations
%g is the function input, so just input g = @(x) 3.^(-x)
%NOTE2: Even tho we're given "p0" I shift the index so p0 = p1 for this
%code, but keep the arugment labelled as p0
%Function returns |pn+1 - pn| and |pn+1hat - pnhat|

format long
pn = zeros(1, max_iter + 3);
pnfinal = zeros(1, max_iter);
pnhat = zeros(1, max_iter + 1);
pnhatfinal = zeros(1, max_iter);

p_curr = p0; %p_curr is initially p1
p_prev1 = g(p0); %p_prev1 = p2 at first
pn(1)= p0;
p_prev2 = g(p_curr); %p_prev2 = p3 at first
pn(2) = p_prev1;
pn(3) = p_prev2;



for it = 1:(max_iter + 1)
    
    pnhat(it) = p_curr - ((p_prev1 - p_curr)^2)/(p_prev2 - 2*p_prev1 + p_curr);
   
    
    p_curr = p_prev1; p_prev1 = p_prev2;
    p_prev2 = g(p_prev2);
    pn(it + 3) = p_prev2;
end

for it = 1:max_iter
 pnfinal(it) = abs(pn(it + 1) - pn(it));
 pnhatfinal(it) = abs(pnhat(it + 1) - pnhat(it));
end
end
    