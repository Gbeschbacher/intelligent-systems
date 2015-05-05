%% learning rate ? [0..1]
function [ x ] = LR( t )
    x = 2 ^ (-(t - 1));
end
