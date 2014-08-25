%% Machine Learning for Timbre and Pitch Determination

%
%  All the files needed other than this one are listed below:
%
%     correct_ratio.m
%     cost_function.m
%     feedforward.m
%     gradient.m
%     ml_data_preprocessing.m
%     neural_network.m
%     normalization.m
%     numerical_gradient.m
%     principal_component_analysis.m
%     sigmoid.m
%     sigmoid_gradient.m
%

%% Initialization
clear;
close all;
clc;

%% Loading data

fprintf('Loading data...\n');
%load('training_data.mat');
load('data_test.mat');

%% Normalization

fprintf('Normalizing the input data...\n');
X = normalization(X);

%% Principal Component Analysis

fprintf('Reducing dimensionality...\n');
X = principal_component_analysis(X);

%% Creating the cross validation set

fprintf('Dividing the raw input into training set and cross validation set...\n');
X1 = [];
X2 = [];
y1 = [];
y2 = [];
m = size(X, 1);
for i=1:m,
    if(rand()<0.75),
        X1 = [X1; X(i, :)];
        y1 = [y1; y(i)];
    else,
        X2 = [X2; X(i, :)];
        y2 = [y2; y(i)];
    end;
end;

%% Training the neural network

fprintf('Training the neural network...\n');
performance = neural_network(X1, X2, y1, y2);
fprintf('\nAfter training, correct ratio on cross validation set is %f%%.\n', performance * 100);
