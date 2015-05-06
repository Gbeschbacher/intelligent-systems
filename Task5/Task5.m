%% Import Data
dC = importdata('Clustering_features/features_A.txt');
dC_classes = importdata('Clustering_classes/classes_C.txt');
dC_STR_LABELS = [cellstr('co'), 'fo', 'ja', 'bl', 'rn','he', 'al', 'pu','ra', 'el', 're', 'ro','po', 'cl'];

%% Number of Iterations T
T = 100;

%% Changes in overall mean quantization error falling threshold E
E = 0.1;

sizes = 5
error_matrix = zeros(sizes);
error_matrix_som = zeros(sizes);

for row = 1:sizes
    for col = 1:sizes

    [ codebook, error ] = SOM( dC, T, E, row, col );

    sMap = som_lininit(X,'msize',[row col],'shape','sheet','lattice','rect');

    error_matrix(row, col) = error;
    error_matrix_som(row, col) = MMQE(dC, sMap.codebook);

    end
end

mesh(error_matrix);
mesh(error_matrix_som);