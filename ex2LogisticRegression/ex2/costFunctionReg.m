function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%lambda是正则化参数，过大会导致欠拟合，过小就不能起到正则化的作用，会overfitting。
%正则化是为了解决overfitting problem。当feature variables很多，训练样本数目又较小时需要正则化。
theta1=theta;
theta1(1,1)=0;
J = (-y'*log(sigmoid(X*theta))-(1-y)'*log(1-sigmoid(X*theta)))/m+lambda/2/m*sum(theta(2:end).^2);
grad = X'*(-y+sigmoid(X*theta))/m+lambda/m*theta1;
% =============================================================

end
