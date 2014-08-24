function [result] = cost_function(X, y, m, n1, n2, n3, theta, lambda)

result = 0;
Theta1 = reshape(theta(1:n2 * (n1 + 1)), n2, (n1 + 1));
Theta2 = reshape(theta((1 + n2 * (n1 + 1)):end), n3, (n2 + 1));
for i=1:m,
    [a1 a2 a3 z2 z3] = feedforward((X(i,:))', n1, n2, n3, Theta1, Theta2);
    correct_output = zeros(n3, 1);
    correct_output(y(i)) = 1; %CAREFUL!!!
    result = result - sum(correct_output .* log(a3)) - sum((1 - correct_output) .* log(1 - a3));
end;
result = result / m;
sTheta1 = sum(Theta1 .^ 2);
sTheta2 = sum(Theta2 .^ 2);
result = result + lambda / (2 * m) * (sum(sTheta1(2:end)) + sum(sTheta2(2:end)));

end