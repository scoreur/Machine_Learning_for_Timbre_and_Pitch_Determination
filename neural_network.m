function [performance] = neural_network(X, X_cv, y, y_cv)

m = size(X, 1);
m_cv = size(X_cv, 1);
n1 = size(X, 2);
n2 = 25; % number of nodes in the hidden layer
n3 = 10; % number of types
epsilon1 = sqrt(6) / sqrt(n1 + n2 + 1);
epsilon2 = sqrt(6) / sqrt(n2 + n3 + 1);
Theta1 = rand(n2, n1 + 1) * 2 * epsilon1 - epsilon1;
Theta2 = rand(n3, n2 + 1) * 2 * epsilon2 - epsilon2;
lambda = 1; % regularization parameter

It = 1000; % number of iterations
alpha = 2; % learning rate
theta = [Theta1(:); Theta2(:)];

for it=1:It,
    theta = theta - alpha * gradient(X, y, m, n1, n2, n3, Theta1, Theta2, lambda);
    Theta1 = reshape(theta(1:n2 * (n1 + 1)), n2, (n1 + 1));
    Theta2 = reshape(theta((1 + n2 * (n1 + 1)):end), n3, (n2 + 1));
    if mod(it, 100) == 0,
        fprintf('After %d iterations, cost on training set is %f, correct ratio on training set is %f%%.\n', ...
            it, cost_function(X, y, m, n1, n2, n3, theta, lambda), correct_ratio(X, y, m, n1, n2, n3, theta) * 100);
        performance = correct_ratio(X_cv, y_cv, m_cv, n1, n2, n3, theta);
        fprintf('After %d iterations, cost on cross validation set is %f, correct ratio on cross validation set is %f%%.\n', ...
            it, cost_function(X_cv, y_cv, m_cv, n1, n2, n3, theta, lambda), performance * 100);
        save parameter_theta Theta1 Theta2
    end;
end;

end