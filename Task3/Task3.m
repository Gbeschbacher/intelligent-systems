function [] = Task3()
dA = importdata('Clustering_features/features_A.txt');
dB = importdata('Clustering_features/features_B.txt');
dC = importdata('Clustering_features/features_C.txt');

NPR_NN = 1;

%% FILE dA
[~, P, D] = ERR(dA, NPR_NN, 'PCA');
SHEPHERD_PLOT(P, D, 'PCA dA Shepherd');

[Y, P, D] = ERR(dA, NPR_NN, 'Sammon');
PLOT(Y, 'Sammon dA Scatter');
SHEPHERD_PLOT(P, D, 'Sammon dA Shepherd');

%% FILE dB
[~, P, D] = ERR(dB, NPR_NN, 'PCA');
SHEPHERD_PLOT(P, D, 'PCA dB Shepherd');

[Y, P, D] = ERR(dB, NPR_NN, 'Sammon');
PLOT(Y, 'Sammon dB Scatter');
SHEPHERD_PLOT(P, D, 'Sammon dB Shepherd');

%% FILE dC
[~, P, D] = ERR(dC, NPR_NN, 'PCA');
SHEPHERD_PLOT(P, D, 'PCA dC Shepherd');

[Y, P, D] = ERR(dC, NPR_NN, 'Sammon');
PLOT(Y, 'Sammon dC Scatter');
SHEPHERD_PLOT(P, D, 'Sammon dC Shepherd');


end

