function y = PLOT(X, name)
%% create figure
fig = figure;
%% figure color
c = linspace(1,10,length(X));
%% plot
scatter(X(:,1), X(:,2), 30, c, 'filled');
%% save image
print(fig, name,'-dpng')
y = fig;