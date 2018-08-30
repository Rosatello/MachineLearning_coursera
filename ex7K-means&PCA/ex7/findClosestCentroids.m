function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
m = size(X,1);
dis = zeros(m,K);
for i = 1:m
    idx(i) = 1;%先归到第一类，若有距离更短的就变化
    dis(i,1) = norm(X(i,:)-centroids(1,:),2);
    for j = 2:K
        dis(i,j) = norm(X(i,:)-centroids(j,:),2);%求模长，即2范数
        if dis(i,j) < dis(i,1)
            idx(i) = j;
            dis(i,1) = dis(i,j);
        end
    end
end
% =============================================================

end

