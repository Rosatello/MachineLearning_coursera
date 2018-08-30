function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
y1=find(y==1);%找出y中等于1的因子的位置（按列）
y2=find(y==0);
plot(X(y1,1),X(y1,2),'k+','LineWidth',2,'MarkerFaceColor','b','MarkerSize',5);
plot(X(y2,1),X(y2,2),'ko','MarkerFaceColor','y','MarkerSize',5);
% =========================================================================

hold off;

end
