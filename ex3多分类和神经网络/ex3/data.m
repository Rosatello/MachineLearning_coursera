close all;clear all;clc
A = xlsread('data.xlsx');
X = A(:,1:6);
y = A(:,7);
m = size(X,1);
rand_indices = randperm(m); %随机打乱数字序列1-m
X_train = X(rand_indices(1:1210), :);%X随机选70%为训练集
y_train = y(rand_indices(1:1210), :);
X_test = X(rand_indices(1211:1728),:);
y_test = y(rand_indices(1211:1728),:);
input_layer_size = 6;
num_labels = 4;
lambda = 0.1;
[all_theta] = oneVsAll(X_train, y_train, num_labels, lambda);
pred = predictOneVsAll(all_theta, X_test);
fprintf('\nAccuracy: %f\n', mean(double(pred == y_test)) * 100);

