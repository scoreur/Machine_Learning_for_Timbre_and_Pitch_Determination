%% Machine Learning for Timbre and Pitch Determination

%
%  All the files needed other than this one are listed below:
%
%     cost_function.m
%     feedforward.m
%     gradient.m
%     neural_network.m
%     normalization.m
%     numerical_gradient.m
%     sigmoid.m
%     sigmoid_gradient.m
%

%% Initialization
clear;
close all;
clc;

%% Setup the parameters

%% Loading data

X = [1, 1; 1, 2; 1, 3; 1, 4; 2, 1; 2, 2; 2, 3; 2, 4; 3, 1; 3, 2; 3, 3; 3, 4];
y = [0; 1; 1; 1; 0; 0; 1; 1; 0; 1; 1; 1];
tmp = X(:, 1) .* X(:, 2);
X = [X, tmp];

%% Normalization

X = normalization(X);

%% Train the neural network

neural_network(X, y);

%% Test the hypothesis on the test set


