function [ MMQE_value ] = MMQE( X, codebook )


    voronoi_set = cell(size(codebook, 1), size(codebook, 2));
    for x_row = 1:size(X, 1),
        x = X(x_row, :);
        bmu_idx = [0, 0];
        min_distance = inf;
        for row = 1:size(codebook, 1),
            for col = 1:size(codebook, 2),
                current_unit = (squeeze(codebook(row, col, :))).';
                current_dist = pdist2(current_unit , x);
                if current_dist < min_distance
                    min_distance = current_dist;
                    bmu_idx = [row, col];
                end
            end
        end
        voronoi_set(bmu_idx(1), bmu_idx(2)) = {[voronoi_set{bmu_idx(1), bmu_idx(2)} bmu_idx]};
    end

    %% DO SAMSING - P. Meerwald 2014
    MMQE_value = 0;
    for row = 1:size(codebook, 1),
        for col = 1:size(codebook, 2),

            current_unit = (squeeze(codebook(row, col, :))).';
            % Without voronoi set because for MMQE the set is cancled
            MQE = 0;
            for v_idx = 1:size(voronoi_set{row, col}),
                x = X(voronoi_set{row, col}(v_idx), :);
                MQE = MQE + (pdist2(x, current_unit, 'euclidean'));
            end

            MMQE_value = MMQE_value + ( 1 /  size(X, 1) ) * MQE;
        end
    end
            

end

