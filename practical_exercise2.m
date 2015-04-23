X=importdata('./Clustering_features/features_C.txt'); % load features
C=importdata('./Clustering_classes/classes_C.txt'); % load class labels
Y=importdata('./C224a/genre_artist.txt'); %load genre-artists

for row = 1 : length(Y);
    VAR = strsplit(char(Y(row)), ':');
    TMP(row) = VAR(1);
    Y_CLEANED = TMP.';
end

%% SCATTER PLOT WITH LABELS
% for perplexity=[5, 20]
% % compute mapping via t-SNE using given perplexity
% D_tsne = tsne(X, [], 2, [], perplexity);
% % visualize projection and class labels in a scatter plot
% figure;
% scatter(D_tsne(:,1), D_tsne(:,2), 25, C, 'filled');
% title(['t-SNE with perplexity ' num2str(perplexity)]);
% end;

%% GSCATTER PLOT WITH LABELS
% for perplexity=[5, 20]
% % compute mapping via t-SNE using given perplexity
% D_tsne = tsne(X, [], 2, [], perplexity);
% % visualize projection and class labels in a scatter plot
% figure;
% gscatter(D_tsne(:,1), D_tsne(:,2), C);
% title(['t-SNE with perplexity ' num2str(perplexity)]);
% % display legend with class names
% legend('country', 'folk', 'jazz', 'blues', 'rnbsoul','heavymetalhardrock', 'alternativerockindie', 'punk','raphiphop', 'electronica', 'reggae', 'rocknroll','pop', 'classical');
% end

%% SOM TOOLBOX
sMap = som_randinit(X,'msize',[4 6],'shape','sheet','lattice','rect');
%sMap = som_lininit(X,'msize',[5 6],'shape','sheet','lattice','rect');
sMap = som_batchtrain(sMap, X,'neigh','gaussian','trainlen', 100);
% sMap = som_seqtrain(sMap, X,'neigh','gaussian','trainlen', 100);

%sData = som_data_struct(X,'name','IS1-data','labels', cellstr(num2str(C)));
sData = som_data_struct(X,'name','IS1-data','labels', cellstr(Y_CLEANED));
sMap = som_autolabel(sMap,sData, 'freq');
% sMap = som_autolabel(sMap,sData);
bmus = som_bmus(sMap, X);
som_show(sMap, 'empty', '','footnote', '','bar', 'none');
som_show_add('label', sMap.labels,'textsize', 7,'textcolor', 'k');

%% SDH TOOLBOX
S = sdh_calculate(sData, sMap,'interp.ntimes', 4,'spread', 3);
sdh_visualize(S, 'labels', sMap.labels,'sofn', 0,'fontcolor', 'k','fontsize', 10, 'gridcolor', 'w', 'grid', 'on');
colormap(jet);

