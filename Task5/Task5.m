%% Import Data
dC = importdata('Clustering_features/features_C.txt');

%% Number of Iterations T
T = 200;

%% Changes in overall mean quantization error falling threshold E
E = 0.1;

sizes = 6;
error_matrix = zeros(sizes);
error_matrix_som = zeros(sizes);

for row = 1:sizes
    for col = 1:sizes
    [row col]
    [ codebook, error ] = SOM( dC, T, E, row, col );

    sMap = som_lininit(dC,'msize',[row col],'shape','sheet','lattice','rect');

    error_matrix(row, col) = error;
    error_matrix_som(row, col) = MMQE(dC, reshape(sMap.codebook, row, col, []));

    end
end

mesh(error_matrix);
mesh(error_matrix_som);
zlabel('MMQE');
ylabel('Grid size col');
xlabel('Grid size row');