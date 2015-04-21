function fig = SHEPHERD_PLOT(P, D, name)

dist = 'euclidean';

P_vec=reshape(P, numel(P), 1);
D_vec=reshape(D, numel(D), 1);

c = linspace(1,10,length(P_vec));

fig = figure;
scatter(P_vec, D_vec, 5, c, 'filled');
set(gca,'FontSize', 26);
xlabel('Proximities');
ylabel('Distances');
title(name);
line;

print(fig, name,'-dpng')
y = fig;