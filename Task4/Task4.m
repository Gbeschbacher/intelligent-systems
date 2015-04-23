function [] = Task4()
dA = importdata('Clustering_features/features_A.txt');
dA_classes = importdata('Clustering_classes/classes_A.txt');
dA_STR_LABELS = [cellstr('Cancer'), 'No Cancer');
dB = importdata('Clustering_features/features_B.txt');
dB_classes = importdata('Clustering_classes/classes_B.txt');
dC = importdata('Clustering_features/features_C.txt');
dC_classes = importdata('Clustering_classes/classes_C.txt');
dC_STR_LABELS = [cellstr('co'), 'fo', 'ja', 'bl', 'rn','he', 'al', 'pu','ra', 'el', 're', 'ro','po', 'cl'];

PERPLEXITY = 5;
Y_dC_PCA = pca(dC, 2);
Y_dC_SAMMON = sammon(dC, 2);
Y_dC_SNE = sne(dC, 2, PERPLEXITY);
Y_dC_TSNE = tsne(dC, [], 2, [], PERPLEXITY);

GPLOT(Y_dC_PCA, dC_classes, dC_STR_LABELS,'DC PCA');
GPLOT(Y_dC_SAMMON, dC_classes,dC_STR_LABELS,'DC SAMMON');
GPLOT(Y_dC_SNE, dC_classes,dC_STR_LABELS,'DC SNE');
GPLOT(Y_dC_TSNE, dC_classes,dC_STR_LABELS,'DC TSNE');


PERPLEXITY = 5;
Y_dB_PCA = pca(dB, 2);
Y_dB_SAMMON = sammon(dB, 2);
Y_dB_SNE = sne(dB, 2, PERPLEXITY);
Y_dB_TSNE = tsne(dB, [], 2, [], PERPLEXITY);

GPLOT(Y_dB_PCA, dB_classes, [],'DC PCA');
GPLOT(Y_dB_SAMMON, dB_classes,[],'DC SAMMON');
GPLOT(Y_dB_SNE, dB_classes,[],'DC SNE');
GPLOT(Y_dB_TSNE, dB_classes,[],'DC TSNE');

PERPLEXITY = 5;
Y_dA_PCA = pca(dA, 2);
Y_dA_SAMMON = sammon(dA, 2);
Y_dA_SNE = sne(dA, 2, PERPLEXITY);
Y_dA_TSNE = tsne(dA, [], 2, [], PERPLEXITY);

GPLOT(Y_dA_PCA, dB_classes, dA_STR_LABELS,'DC PCA');
GPLOT(Y_dA_SAMMON, dB_classes,dA_STR_LABELS,'DC SAMMON');
GPLOT(Y_dA_SNE, dB_classes,dA_STR_LABELS,'DC SNE');
GPLOT(Y_dA_TSNE, dB_classes,dA_STR_LABELS,'DC TSNE');