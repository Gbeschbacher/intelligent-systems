function [] = Task1()
dA = importdata('Clustering_features/features_A.txt');
dB = importdata('Clustering_features/features_B.txt');
dC = importdata('Clustering_features/features_C.txt');

[dC_PCA, dC_dim] = PCA(dC,2);
dC_dim
figC = PLOT(dC_PCA, 'PCA_C');


[dB_PCA, dB_dim] = PCA(dB,2);
dB_dim
figB = PLOT(dB_PCA, 'PCA_B');


[dA_PCA, dA_dim] = PCA(dA,2);
dA_dim
figA = PLOT(dA_PCA, 'PCA_A');

end