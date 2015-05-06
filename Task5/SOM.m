function [ codebook, MMQE_val ] = SOM( X, T, E, map_rows, map_cols )
    %% Size of Xset

    m = map_rows;
    n = map_cols;

    X_num_cols = size(X, 2);


    %% Initializing codebook
    % Initialize each unit (model vector) mi to represent a randomly selected X item
    % 5 Rows, 5 Columns, 1244 Pages [ 5 5 1244 ]
    % filled up with random values between 0 and 1

    % Page in Multidimensional Array is our Model-Vector
    codebook = rand([m, n, X_num_cols]);

    TMP_X = X;
    for i = 1:m,
        for j = 1:n,

            TMP_idx = randi(size(TMP_X, 1));
            codebook(m, n, :) = TMP_X(TMP_idx,:);
            TMP_X(TMP_idx,:) = [];
        end
    end

    %% Loop over time steps T, until convergence
    codebook_nextgen = codebook;

    for t = 1:T,
        % randomly selected an example x
        x = X(randi(size(X, 1)), :);
        min_unit_idx = [0, 0];
        min_distance = inf;
        % find bmu uc with mc

        for row = 1:m,
            for col = 1:n,

                % euclidean distance between a and b where a and b are vectors
                % find the ‘winning unit’ (best matching unit) uc with
                % mc = maxi(sim(mi,x))
                current_unit = (squeeze(codebook(row, col, :))).';
                current_dist = pdist2(current_unit , x);
                if current_dist < min_distance
                    min_distance = current_dist;
                    min_unit_idx = [row, col];
                end
            end
        end

        % adapt model vectors of all units as
        for row = 1:m,
            for col = 1:n,
                % mi(t +1) = mi(t) + ?(t) · uic(t) · [x?mi(t)]
                gauss_mod = UTIL([row, col], min_unit_idx, t);
                euclidian_diff = x - squeeze(codebook(row, col, :)).';
                adaption_vector = squeeze(LR(t) * gauss_mod * euclidian_diff).';

                codebook_nextgen(row, col, :) = ...
                    squeeze(codebook(row, col, :)) + adaption_vector;
            end
        end

        codebook = codebook_nextgen;

        MMQE_val = MMQE(X, codebook);
        MMQE_val
        t
        if MMQE_val < E
            break;
        end
    end
end

