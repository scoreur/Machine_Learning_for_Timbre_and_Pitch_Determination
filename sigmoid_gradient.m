function [result] = sigmoid_gradient(x)

result = sigmoid(x) .* (1 - sigmoid(x));

end