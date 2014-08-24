function [result] = normalization(X)

m = size(X, 1);
n = size(X, 2);
result = X;

for j=1:n,
    miu = 0;
    sigma = 0;
    for i=1:m,
        miu = miu + X(i, j);
    end;
    miu = miu / m;
    for i=1:m,
        result(i, j) = result(i, j) - miu;
    end;
    for i=1:m,
        sigma = sigma + (result(i, j))^2;
    end;
    sigma = (sigma / m)^0.5;
    if sigma > 1e-5,
        for i=1:m,
            result(i, j) = result(i, j) / sigma;
        end;
    end;
end