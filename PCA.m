function [data, dim] = PCA(X, k)
%% mean-normalize
meanX = repmat(mean(X),size(X,1),1);
normX = X - meanX;
%% co-variance matrix
covar = cov(X);
%% eigendecomposition
[eVec,eVal_] = eig(covar);
eVal = diag(eVal_);
%%% SECTION TITLE
% DESCRIPTIVE TEXT
%% sort
[y,i] = sort(eVal, 'descend');
eVecSorted = eVec(:,i);
data =  normX * eVecSorted(:,1:k);
%% sumup covariance
sumEVal = sum(eVal);
sumEVal_90percent = 0.9 * sumEVal;

i = 1;
s = 0;
while (s < sumEVal_90percent && i < length(eVal))
  s = s + y(i);
  i = i + 1;
end;

dim = i;


