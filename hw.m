function [fn, pn, en] = hw(f, xs, n)
%Produces fn, then pn, then en for each n.
%Technically n paramter is unnecessary
%n must equal n + 1
%Helper function to acheive problem 2 efficiently
fn = zeros(n, 1);
pn = zeros(n, 1);
en = zeros(n, 1);
for iter = 1:n
    fn(iter) = f(xs(iter));
end
for iter = 1:n
    x = xs(iter);
    pn(iter) = interpolation_power(xs, fn', x);
end
for iter = 1:n
    en(iter) = abs(fn(iter) - pn(iter));
end
plot(xs, fn, 'b', xs, pn, 'r')
xlabel('x')
ylabel('pn(x) (Red) and f(x) (Blue)');
figure;
plot(xs, en);
xlabel('x')
ylabel('en(x) = |f(x) - pn(x)|');

