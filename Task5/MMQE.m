function [ MMQE_value ] = MMQE( X, codebook )
    
    TMP_X = X;

%     voronoi_set_count = zeros(size(codebook,1), size(codebook,2));


    %% CALC BMU FOR EVERY DATA ITEM (VORONOI SET)
%     for x_row = 1:size(X, 1),
%         min_unit_idx = [0, 0];
%         min_distance = inf;
%         x = X(x_row, :);
% 
%         for row = 1:size(codebook, 1),
%             for col = 1:size(codebook, 2),
%                 current_unit = (squeeze(codebook(row, col, :))).';
%                 current_dist = pdist2(current_unit , x);
%                 if current_dist < min_distance
%                     min_distance = current_dist;
%                     min_unit_idx = [row, col];
%                 end
%             end
%         end
% 
%         voronoi_set_count(min_unit_idx(1), min_unit_idx(2)) = ...
%             voronoi_set_count(min_unit_idx(1), min_unit_idx(2)) ...
%             + 1;
%     end

    
    %% DO SAMSING - P. Meerwald 2014
    MMQE_value = 0;
    for row = 1:size(codebook, 1),
        for col = 1:size(codebook, 2),
            
            current_unit = (squeeze(codebook(row, col, :))).';
            % Without voronoi set because for MMQE the set is cancled
            MQE = 0;
            for x_row = 1:size(X, 1),
                x = X(x_row, :);   
                MQE = MQE + (pdist2(x, current_unit, 'euclidean'));
            end
            
            MMQE_value = MMQE_value + ( 1 / ... 
                ( size(codebook, 1) * size(codebook, 2))) ...
                * MQE;
        end
    end


end

