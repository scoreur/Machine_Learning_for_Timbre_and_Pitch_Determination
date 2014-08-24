function [result] = correct_ratio(X, y, m, n1, n2, n3, theta)

result = 0;
Theta1 = reshape(theta(1:n2 * (n1 + 1)), n2, (n1 + 1));
Theta2 = reshape(theta((1 + n2 * (n1 + 1)):end), n3, (n2 + 1));
for i=1:m,
    [a1 a2 a3 z2 z3] = feedforward((X(i,:))', n1, n2, n3, Theta1, Theta2);
    max_prob = -1;
    max_index = 0;
    for j=1:n3,
        if a3(j) > max_prob,
            max_prob = a3(j);
            max_index = j;
        end;
    end;
    if max_index == y(i), %CAREFUL!!!
        result = result + 1;
    end;
end;
result = result / m;


end