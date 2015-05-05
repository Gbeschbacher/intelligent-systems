%% Import Data
dC = importdata('Clustering_features/features_A.txt');
dC_classes = importdata('Clustering_classes/classes_C.txt');
dC_STR_LABELS = [cellstr('co'), 'fo', 'ja', 'bl', 'rn','he', 'al', 'pu','ra', 'el', 're', 'ro','po', 'cl'];

%% Init rows / cols
rows = 5;
cols= 5;

%% Number of Iterations T
T = 100;

%% Changes in overall mean quantization error falling threshold E
E = 5;

codebook = SOM( dC, T, E, rows, cols );

