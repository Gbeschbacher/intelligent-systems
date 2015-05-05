%% Utility Function
function [ x ] = UTIL( unit_idx1, unit_idx2, t )
    distance = pdist2(unit_idx1, unit_idx2, 'cityblock');
    % pseudo-Gaussian
    x = exp( (-distance^2) / (NBHR(t)^2) );
end