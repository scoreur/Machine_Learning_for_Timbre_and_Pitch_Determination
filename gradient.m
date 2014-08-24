function [result] = gradient(X, y, m, n1, n2, n3, Theta1, Theta2, lambda)

Delta1 = zeros(size(Theta1));
Delta2 = zeros(size(Theta2));
for i=1:m,
    [a1 a2 a3 z2 z3] = feedforward((X(i,:))', n1, n2, n3, Theta1, Theta2);
    correct_output = zeros(n3, 1);
    correct_output(y(i)) = 1; %CAREFUL!!!
    d3 = a3 - correct_output;
    d2 = (Theta2' * d3) .* [0; sigmoid_gradient(z2)];
    Delta1 = Delta1 + d2(2:end) * a1';
    Delta2 = Delta2 + d3 * a2';
end;
Delta1 = Delta1 / m;
Delta2 = Delta2 / m;
Theta1 = Theta1(:, 2:end);
Theta2 = Theta2(:, 2:end);
Theta1 = [zeros(size(Theta1, 1), 1), Theta1];
Theta2 = [zeros(size(Theta2, 1), 1), Theta2];
Delta1 = Delta1 + lambda / m * Theta1;
Delta2 = Delta2 + lambda / m * Theta2;

result = [Delta1(:); Delta2(:)];

% Use numerical methods to ensure the correctness.
% numerical_result = numerical_gradient(X, y, m, n1, n2, n3, Theta1, Theta2);
% [result numerical_result]

end