function [Z] = principal_component_analysis(X)

m = size(X, 1);
n = size(X, 2);
Sigma = X' * X / m;
[U, S, V] = svd(Sigma);
rate = 0.65;
Ur = U(:, 1:(uint32(n * rate)));
Z = X * Ur;
s = sum(S .* eye(size(S, 1)));
fprintf('By keeping %f%% of the features, %f%% of variance is retained.\n', rate * 100, sum(s(1:(uint32(n * rate)))) / sum(s) * 100);