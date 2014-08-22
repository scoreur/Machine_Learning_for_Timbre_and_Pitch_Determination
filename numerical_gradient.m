function [result] = numerical_gradient(X, y, m, n1, n2, n3, Theta1, Theta2)

epsilon = 0.0001;
theta = [Theta1(:); Theta2(:)];
result = zeros(size(theta, 1), 1);
for i=1:size(theta, 1),
    theta_plus = theta;
    theta_minus = theta;
    theta_plus(i) = theta_plus(i) + epsilon;
    theta_minus(i) = theta_minus(i) - epsilon;
    result(i) = (cost_function(X, y, m, n1, n2, n3, theta_plus) - ...
        cost_function(X, y, m, n1, n2, n3, theta_minus)) / (2 * epsilon);
end;

end