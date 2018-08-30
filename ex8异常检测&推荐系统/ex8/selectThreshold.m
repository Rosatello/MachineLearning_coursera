function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    
    predictions = (pval<epsilon);%如果成立,判为不正常，predictions取1，否则取0
    tp = sum((predictions==1)&(yval==1));%true positive
    fp = sum((predictions==1)&(yval==0));%false positive
    fn = sum((predictions==0)&(yval==1));%false negative
    prec = tp/(tp+fp);%查准率precision:预测为1的样本中，预测对的比率（你的预测有多少是对的）
    rec = tp/(tp+fn);%召回率/查全率recall：真实值为1的样本中，预测对的比率（正例中你的预测覆盖了多少比例）
    F1 = 2*prec*rec/(prec+rec);
    % =============================================================
    if F1 > bestF1%寻找最大的F1值
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
