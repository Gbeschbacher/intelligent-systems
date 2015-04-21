function [] = Task2()
dA = importdata('Clustering_features/features_A.txt');
dB = importdata('Clustering_features/features_B.txt');
dC = importdata('Clustering_features/features_C.txt');


P_dA = squareform(pdist(dA, 'euclidean'));
P_dB = squareform(pdist(dB, 'euclidean'));
P_dC = squareform(pdist(dC, 'euclidean'));

P_dA = P_dA ./ max(max(P_dA));
P_dB = P_dB ./ max(max(P_dB));
P_dC = P_dC ./ max(max(P_dC));

dA_map = PCA(dA, 2);
dB_map = PCA(dB, 2);
dC_map = PCA(dC, 2);

D_dA = squareform(pdist(dA_map, 'euclidean'));
D_dB = squareform(pdist(dB_map, 'euclidean'));
D_dC = squareform(pdist(dC_map, 'euclidean'));

D_dA = D_dA ./ max(max(D_dA));
D_dB = D_dB ./ max(max(D_dB));
D_dC = D_dC ./ max(max(D_dC));

NN = [1, 3, 5, 10, 25, 50];

for NN_current = NN
    NPR_dA = compute_NPR(P_dA, D_dA, NN_current);
    NPR_dB = compute_NPR(P_dB, D_dB, NN_current);
    NPR_dC = compute_NPR(P_dC, D_dC, NN_current);
    
    disp(['CUR_NN  -  ', num2str(NN_current)]);
    disp(['NPR_dA  -  ', num2str(NPR_dA)]);
    disp(['NPR_dB  -  ', num2str(NPR_dB)]);
    disp(['NPR_dC  -  ', num2str(NPR_dC)]);
end

end

