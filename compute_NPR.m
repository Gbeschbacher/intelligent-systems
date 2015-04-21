function NPR = compute_NPR(P, D, NN)

[distances_P, knn_P] = find_nn(triu(P, 1), NN);
[distances_D, knn_D] = find_nn(triu(D, 1), NN);

res = 0;
len = length(knn_P);

for num_rows = 1:len
    res = res + length(intersect(knn_P(num_rows,:),knn_D(num_rows,:)));
end

NPR = res / (len * NN) * 100;

end