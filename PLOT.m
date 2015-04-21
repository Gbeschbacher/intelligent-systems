function y = PLOT(X, name)
fig = figure;
c = linspace(1,10,length(X));
scatter(X(:,1), X(:,2), 30, c, 'filled');
set(gca,'FontSize', 26);
title(name);
print(fig, name,'-dpng')
y = fig;