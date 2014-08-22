function [a1 a2 a3 z2 z3] = feedforward(x, n1, n2, n3, Theta1, Theta2);

a1 = x;
a1 = [1; a1];
z2 = Theta1 * a1;
a2 = sigmoid(z2);
a2 = [1; a2];
z3 = Theta2 * a2;
a3 = sigmoid(z3);

end