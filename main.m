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

load('data_test.mat');

%% Normalization

X = normalization(X);

%% Creating the cross validation set

X1 = X(1, :);
X2 = X(2, :);
y1 = y(1);
y2 = y(2);
for i=3:5000,
    if(rand()<0.8),
        X1 = [X1; X(i, :)];
        y1 = [y1; y(i)];
    else,
        X2 = [X2; X(i, :)];
        y2 = [y2; y(i)];
    end;
end;

X = X1;
y = y1;

%% Training the neural network

%X2=X ; y2=y;
neural_network(X, X2, y, y2);

%% Testing the hypothesis on the test set


