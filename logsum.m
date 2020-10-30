function [lhs, sum] = logsum(n)
%matlab code to figure out integer value for which
%n - log2(10^-5) <= sum(log2(i))
sum = 0;
lhs = n - log2(10^-5)
for it = 1:n
    sum = sum + log2(it);
end