function [performance] = neural_network(X, y)

m = size(X, 1);
n1 = size(X, 2);
n2 = 2 * n1; % number of nodes in the hidden layer
n3 = 20; % number of types
epsilon1 = sqrt(6) / sqrt(n1 + n2 + 1);
epsilon2 = sqrt(6) / sqrt(n2 + n3 + 1);
Theta1 = rand(n2, n1 + 1) * 2 * epsilon1 - epsilon1;
Theta2 = rand(n3, n2 + 1) * 2 * epsilon2 - epsilon2;

It = 100000;
alpha = 2;
theta = [Theta1(:); Theta2(:)];

for it=1:It,
    theta = theta - alpha * gradient(X, y, m, n1, n2, n3, Theta1, Theta2);
    Theta1 = reshape(theta(1:n2 * (n1 + 1)), n2, (n1 + 1));
    Theta2 = reshape(theta((1 + n2 * (n1 + 1)):end), n3, (n2 + 1));
    if mod(it, 100) == 0,
        fprintf('After %d iterations, the cost is %f\n', it, cost_function(X, y, m, n1, n2, n3, theta));
    end;
end;


end