function pn = interpolation_power(xs, fs, x)
    n = length(xs) - 1;
    if size(xs) ~= [1, n+1]
        error('xs is not row vector, improper dimensions')
    elseif ~ismatrix(fs) || size(fs, 1) ~= 1
        error('fs is not a row vector')
    elseif size(fs, 2) ~= n + 1
        error ('wrong number of points in fs')
    end
    
    V = vander(xs);
    as = V \ fs';
    temp = (x .^(n:-1:0));
    pn = temp * as;
end