function [sstress, kstress, msloss] = ERR(X)
% set distance function
dist = 'euclidean'

% apply some data projection technique
Y = compute_mapping(X, 'tSNE');      % using DR toolbox's wrapper

% compute proximities in input space
P = squareform(pdist(X, dist));
P = P ./ max(max(P));

% compute distances in output space
D = squareform(pdist(Y, dist));
D = D ./ max(max(D));


% COMPUTE ERROR ESTIMATES

% S-stress
sstress = sum(sum(P.^2-D.^2).^2);
disp(['S-Stress: ', num2str(sstress)]),

% Kruskal's stress
kstress_tmp = (P-D).^2 ./ P.^2;
idx_notNaN = find(~isnan(kstress_tmp));             % identify NaN's (caused by div-by-0)
kstress = sum(sum(kstress_tmp(idx_notNaN)));        % compute Kruskal's stress on numeric values only
disp(['Kruskal''s stress: ', num2str(kstress)]),

% Multiscale loss
msloss_tmp = (log(P)-log(D)).^2;
idx_notNaN = find(~isnan(msloss_tmp));             % identify NaN's caused by log(0)=-Inf
msloss = sum(sum(msloss_tmp(idx_notNaN)));         % compute multiscale loss on numeric values only
disp(['Multiscale loss: ', num2str(msloss)]),


% version of Kruskal's considering only upper part of proximity and distance matrix
krusk_up = ((triu(P,1) - triu(D,1)).^2) ./ triu(P,1).^2;   % upper matrix part
kstress = sum(krusk_up(find(~isnan(krusk_up))));
%disp(['Kruskal''s stress: ', num2str(kstress)]),