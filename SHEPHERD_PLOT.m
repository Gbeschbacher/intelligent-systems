function fig = SHEPHERD_PLOT(X, k)
%%
% Implemenation of a Shepherd plot, comparing the input space proximities
% with output space distances obtained via Sammon's mapping.
%

%% set distance function
dist = 'euclidean';

%% apply Sammon's mapping
Y = sammon(X, 2);                  % using DR toolbox function sammon

%% compute proximities in input space
P = squareform(pdist(X, dist));
P = P ./ max(max(P));

%% compute distances in output space
D = squareform(pdist(Y, dist));
D = D ./ max(max(D));

%% concert to vector representation
P_vec=reshape(P, numel(P), 1);
D_vec=reshape(D, numel(D), 1);

%% plot
fig = figure;
scatter(P_vec, D_vec, 5, 'filled');
set(gca,'FontSize', 26);
xlabel('Proximities');
ylabel('Distances');
title('Shepherd plot');
line;       % add diagonal line

%% save image
print(fig,'fig_shepperd','-dpng')
y = fig;