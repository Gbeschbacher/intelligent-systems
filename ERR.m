function [Y, P, D] = ERR(X, NN, MAPPING)

dist = 'euclidean';

Y = compute_mapping(X, MAPPING);

P = squareform(pdist(X, dist));
P = P ./ max(max(P));

D = squareform(pdist(Y, dist));
D = D ./ max(max(D));

sstress = sum(sum(P.^2-D.^2).^2);
disp(['S-Stress: ', num2str(sstress)]);

kstress_tmp = (P-D).^2 ./ P.^2;
idx_notNaN = find(~isnan(kstress_tmp));
kstress = sum(sum(kstress_tmp(idx_notNaN)));
disp(['Kruskal''s stress: ', num2str(kstress)]);

msloss_tmp = (log(P)-log(D)).^2;
idx_notNaN = find(~isnan(msloss_tmp));
msloss = sum(sum(msloss_tmp(idx_notNaN)));
disp(['Multiscale loss: ', num2str(msloss)]);

npr = compute_NPR(P, D, NN);
disp(['NPR: ', num2str(npr)]);